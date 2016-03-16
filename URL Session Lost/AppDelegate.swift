//
//  AppDelegate.swift
//  URL Session Lost
//
//  Created by Martin Nash on 3/15/16.
//  Copyright © 2016 Martin Nash. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func applicationDidBecomeActive(application: UIApplication) {
        
        // Steps to reproduce
        // 1. Run on iOS device
        // 2. Lock device
        // 3. Unlock device
        // 4. Observe error (NSURLErrorNetworkConnectionLost)

//        URLCaller().callWithStandardSharedSession { (data, response, error) -> Void in
//            print(error?.description ?? "(no error)")
//        }
        
        let url = NSURL(string: "https://google.com")!
        let session = NSURLSession.sharedSession()
        
        let task = URLCaller.dataTaskWithURL(url, completionHandler: { _, _, error in
            print(error)
        })
        task.resume()
        
    }
    


}

