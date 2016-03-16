//
//  URLCaller.swift
//  URL Session Lost
//
//  Created by Martin Nash on 3/15/16.
//  Copyright © 2016 Martin Nash. All rights reserved.
//

import Foundation

private let singletonSessionHolder = SessionHolder()

class URLCaller {

    let url = NSURL(string: "https://apple.com")!
    
    func callWithStandardSharedSession(handler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        let sharedSession = NSURLSession.sharedSession()
        let task = sharedSession.dataTaskWithURL(url, completionHandler: handler)
        task.resume()
    }

    func callWithFreshlyCreatedSession(handler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        let defaultConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        let freshSession = NSURLSession(configuration: defaultConfig)
        let task = freshSession.dataTaskWithURL(url, completionHandler: handler)
        task.resume()
    }

    func callWithCustomSingletonSession(handler: (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void) {
        let task = singletonSessionHolder.session.dataTaskWithURL(url, completionHandler: handler)
        task.resume()
    }
    
}

private class SessionHolder {
    
    let session: NSURLSession
    
    init() {
        let defaultConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        session = NSURLSession(configuration: defaultConfig)
    }
    
}
