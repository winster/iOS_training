//
//  AppProvider.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class AppProvider: NSObject {

    func getApps() -> [AppModel] {
        var apps : [AppModel] = []
        
        let app1 = AppModel()
        app1.icon = UIImage(named: "home")
        app1.name = "App1"
        app1.publisherName = "Publisher 1"
        apps.append(app1)
        
        let app2 = AppModel()
        app2.icon = UIImage(named: "gallery")
        app2.name = "App2"
        app2.publisherName = "Publisher 2"
        apps.append(app2)
        
        let app3 = AppModel()
        app3.icon = UIImage(named: "apps")
        app3.name = "App3"
        app3.publisherName = "Publisher 3"
        apps.append(app3)
        
        return apps
    }
}
