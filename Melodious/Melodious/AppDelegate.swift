//
//  AppDelegate.swift
//  Melodious
//
//  Created by Charles Wesley Cho on 9/11/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

import Parse
import Bolts
import FBSDKCoreKit
import FBSDKLoginKit
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.statusBarStyle = .LightContent
//        self.window?.tintColor = UIColor.orangeColor()
        
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        //Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Game.registerSubclass()
        User.registerSubclass()
        Parse.setApplicationId("ert9Xm9hkX0xlUbo0bQaeK7mMfvQCB9P3Ey4e8iN",
            clientKey: "01Z4UwEwCwOerop9KwJmNkJXeTwGcVMC1PxhnObz")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
                
        // Initialize Facebook
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        // Initialize Crashlytics
        
        Fabric.with([Crashlytics.self])

        return true
    }
    
    func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application,
                openURL: url,
                sourceApplication: sourceApplication,
                annotation: annotation)
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }


}

