//
//  JSONViewController.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class JSONViewController: UIViewController, GetUserTypesParserDelegate {
    
    var parser : GetUserTypesParser?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = UIRectEdge.None
        self.view.backgroundColor = UIColor.whiteColor()
        
        parser = GetUserTypesParser()
        parser!.getUserTypes()
        parser!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceivedUserTypes(userTypes : [UserTypeModel]) {
        print("count of user types:: \(userTypes.count)")
    }
    
    func didReceivedError() {
        print("received error")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
