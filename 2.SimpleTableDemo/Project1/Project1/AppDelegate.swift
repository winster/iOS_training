//
//  AppDelegate.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var baseController: UITabBarController?
    
    func createTabs(){
        var tabControllers:[UIViewController] = []
        
        for i in 0..<3 {
            var tabController: UIViewController?
            switch i {
            case 0:
                tabController = ViewController()
                tabController!.tabBarItem.title = "Home"
                tabController!.tabBarItem.image = UIImage(named: "home")
            case 1:
                tabController = GalleryViewController()
                tabController!.tabBarItem.title = "Gallery"
                tabController!.tabBarItem.image = UIImage(named: "gallery")
            case 2:
                tabController = AppsViewController()
                tabController!.tabBarItem.title = "Apps"
                tabController!.tabBarItem.image = UIImage(named: "apps")
            default:
                tabController = nil
            }
            tabControllers.append(tabController!)
        }
        baseController = UITabBarController()
        baseController!.viewControllers = tabControllers
        baseController!.tabBar.tintColor = UIColor.cyanColor()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        createTabs()
        window!.rootViewController = baseController
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

