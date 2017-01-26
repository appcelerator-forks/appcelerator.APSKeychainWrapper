//
//  ViewController.swift
//  APSKeychainWrapperTests
//
//  Created by Hans Knoechel on 19/11/2016.
//  Copyright © 2016 Appcelerator. All rights reserved.
//

import UIKit

class ViewController: UIViewController, APSKeychainWrapperDelegate {
    
    var keychainItem : APSKeychainWrapper!

    override func viewDidLoad() {
        super.viewDidLoad()

        keychainItem = APSKeychainWrapper(identifier: "password", service: "myservice", accessGroup: "$(AppIdentifierPrefix)com.appcelerator.APSKeychainWrapperTests")
        keychainItem.delegate = self
    }
    
    @IBAction func saveToKeychain() {
        keychainItem.save("my_secret_password")
    }
    
    @IBAction func readFromKeychain() {
        keychainItem.exists({ (success: Bool, error: Error?) in
            if (error != nil) {
                print("Error reading from keychain: \(error?.localizedDescription)")
                return
            }
            
            if success {
                self.keychainItem.read()
            }
        })
    }
    
    @IBAction func updateToKeychain() {
        keychainItem.update("my_new_password")
    }
    
    @IBAction func deleteFromKeychain() {
        keychainItem.reset()
    }

    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithError error: Error!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithResult result: [AnyHashable : Any]!) {
        
    }
    
    func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithResult result: [AnyHashable : Any]!) {
        
    }
}

