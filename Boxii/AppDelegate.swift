//
//  AppDelegate.swift
//  Boxii
//
//  Created by Chen Yu Tsen on 6/14/14.
//  Copyright (c) 2014 BoxiiApp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        Parse.setApplicationId(PARSE_APP_ID, clientKey:PARSE_API_KEY)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleErrorMessaging:", name: NOTIFICATION_ERROR, object: nil)
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
    func handleErrorMessaging(sender:NSNotification?){
        
        var title = sender!.userInfo["title"] as NSString
        var message = sender!.userInfo["message"] as NSString
        var errorCode = sender!.userInfo["errorCode"] as NSInteger
        println("title=\(title) message = \(message) errorCode = \(errorCode)")
        var alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertViewController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.window!.rootViewController.presentViewController(alertViewController, animated: true, completion: nil)
        SVProgressHUD.dismissHUDAsync()
    }

}

