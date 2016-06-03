//
//  AppDelegate.swift
//  Need_A_Sitter
//
//  Created by Ratnakala33 on 3/29/16.
//  Copyright © 2016 Ratnakala33. All rights reserved.
//

import UIKit
import FBSDKLoginKit

import Fabric
import TwitterKit

//526499103591-jpm4d491msocjv02bfv084oh0ol94cm6.apps.googleusercontent.com


var Globalstory = UIStoryboard(name: "Main", bundle: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate//,GIDSignInDelegate
{

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        GIDSignIn.sharedInstance().clientID = "526499103591-mfbliaaphmj8vg1ofdi1q347vdusslsb.apps.googleusercontent.com"
        
        Twitter.sharedInstance().startWithConsumerKey("aO5QhM6aZKO8bZPy33CiM8Mv4", consumerSecret: "RM3iHG8qnDSqlZp5VepW4vqHLrjagvLI2M4Dit49st85Iwd4xf")
        Fabric.with([Twitter.self])

        
        
        if(UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            Globalstory = UIStoryboard(name: "Main_ipad", bundle: nil)
        }
        else
        {
            Globalstory = UIStoryboard(name: "Main", bundle: nil)
        }
        
        self.window?.rootViewController = Globalstory.instantiateInitialViewController()! as UIViewController
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        if(url.scheme.isEqual("fb231735877185233"))
        {
            print("Facebook url scheme")
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        }
        else if LISDKCallbackHandler.shouldHandleUrl(url)
        {
            return LISDKCallbackHandler.application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        }
        else
        {
            return false
            return GIDSignIn.sharedInstance().handleURL(url,sourceApplication: sourceApplication,annotation: annotation)
            
           
        }
        
        
    }

    @available(iOS 9.0, *)
    func application(application: UIApplication,
        openURL url: NSURL, options: [String: AnyObject]) -> Bool
    {
        
            return GIDSignIn.sharedInstance().handleURL(url, sourceApplication:   options[UIApplicationOpenURLOptionsSourceApplicationKey] as! String, annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
        
    }
    
    
    
    
    
    func applicationWillResignActive(application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication)
    {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication)
    {
        FBSDKAppEvents.activateApp()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

