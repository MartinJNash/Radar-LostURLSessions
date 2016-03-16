//
//  ViewController.swift
//  URL Session Lost
//
//  Created by Martin Nash on 3/15/16.
//  Copyright © 2016 Martin Nash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    
    @IBAction func callWithStandardSharedSingleton(sender: AnyObject) {
        self.textView.text = "Calling with shared singleton session\n\n"
        URLCaller().callWithStandardSharedSession { (data, response, error) -> Void in
            self.appendTextToTextView(error?.description ?? "(no error)")
        }
    }
    
    @IBAction func callWithCustomSingleton(sender: AnyObject) {
        self.textView.text = "Calling with custom singleton session\n\n"
        URLCaller().callWithCustomSingletonSession { (data, response, error) -> Void in
            self.appendTextToTextView(error?.description ?? "(no error)")
        }
    }
    
    @IBAction func callWithFreshlyCreatedSession(sender: AnyObject) {
        self.textView.text = "Calling with freshly created session\n\n"
        URLCaller().callWithFreshlyCreatedSession { (data, response, error) -> Void in
            self.appendTextToTextView(error?.description ?? "(no error)")
        }
    }
    
    private func appendTextToTextView(text: String) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.textView.insertText(text)
        }
    }
}

