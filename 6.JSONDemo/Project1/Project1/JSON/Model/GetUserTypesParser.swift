//
//  GetUserTypesParser.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

/*
 1. create an agent (model) class
 2. implement it's purpose
  2.1 Get the data from the server
  2.2 Process data from server
 3. create a container(optional)
 4. create a pure model class (optional)
 5. implement feedback mechanism
 */

@objc protocol GetUserTypesParserDelegate : NSObjectProtocol {
    
    func didReceivedUserTypes(userTypes : [UserTypeModel])
    optional func didReceivedError()
}

class GetUserTypesParser: NSObject {

    var webData : NSMutableData?
    weak var delegate : GetUserTypesParserDelegate?
    
    func getUserTypes(){
        /*
         1. Create a URL
         2. Create a request
         3. Create a connection
         4. Get response through connection
         5. Get data through connection
         */
        let webURL = NSURL(string: "http://test.chatongo.com/api/GetUserTypes")
        let webRequest = NSURLRequest(URL: webURL!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
        let connection = NSURLConnection(request: webRequest, delegate: self)
        
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        if delegate != nil {
            if delegate!.respondsToSelector(#selector(GetUserTypesParserDelegate.didReceivedError)) {
                delegate!.didReceivedError!()
            }
        }
    }
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
        webData = NSMutableData()
        
        //response.expectedContentLength
        
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
        webData!.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection)
    {
        processData()
        //let responseString = NSString(data: webData!, encoding: NSUTF8StringEncoding)
        //print("response:: \(responseString)")
    }
    
    func processData() {
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(webData!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
            let Status = result!.objectForKey("Status") as? Int
            if Status == 200 {
                let data = result!.objectForKey("data") as? [NSDictionary]
                var userTypes : [UserTypeModel] = []
                for i in 0..<data!.count {
                    let jsonObject = data![i]
                    let userType = UserTypeModel()
                    userType.UserTypeId = jsonObject.objectForKey("UserTypeId") as? String
                    userType.UserTypeName = jsonObject.objectForKey("UserTypeName") as? String
                    userType.Tax = jsonObject.objectForKey("Tax") as? Int
                    
                    userTypes.append(userType)
                    //print("UserTypeId:: \(userType.UserTypeId)")
                    //print("UserTypeName:: \(userType.UserTypeName)")
                    //print("Tax:: \(userType.Tax)")
                }
                //print("count of user types:: \(userTypes.count)")
                if delegate != nil {
                    delegate!.didReceivedUserTypes(userTypes)
                }
            } else {
                if delegate != nil {
                    if delegate!.respondsToSelector(#selector(GetUserTypesParserDelegate.didReceivedError)) {
                        delegate!.didReceivedError!()
                    }
                }
            }
        } catch {
            if delegate != nil {
                if delegate!.respondsToSelector(#selector(GetUserTypesParserDelegate.didReceivedError)) {
                    delegate!.didReceivedError!()
                }
            }
        }
    }
}
