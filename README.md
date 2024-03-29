# 🔐 APSKeychainWrapper

The `APSKeychainWrapper` is an Objective-C based wrapper to apply advanced access control 
to the iOS Keychain.

It's primary purpose for now is to be used in the Apcpelerator Titanium module [Ti.TouchID](https://github.com/appcelerator-modules/ti.touchid).

### Example

#### Objective-C

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create a new keychain item instance
    APSKeychainWrapper *keychainItem = [[[APSKeychainWrapper alloc] initWithIdentifier:@"myaccount"
                                                                               service:@"com.appcelerator.service"
                                                                           accessGroup:@"$(AppIdentifierPrefix)com.appcelerator.keychain"
                                                                     accessibilityMode:kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
                                                                     accessControlMode:kSecAccessControlTouchIDAny
                                                                               options:@{(id)kSecUseOperationPrompt: @"Please authenticate yourself before"}];

    // Implement the APSKeychainWrapperDelegate in your class before
    [keychainItem setDelegate:self];

    // Check existence asynchronously, since the result might be delayed by the user-interacton (e.g. Touch ID)
    [keychainItem exists:^(BOOL success, NSError *error) {
        if (error) {
            NSLog(@"Error checking existence: %@", [error localizedDescription]);
            return;
        }
        
        NSLog(@"Does item exist: %lu", success);
    }];

    // Read
    [keychainItem read];

    // Save
    [keychainItem save:@"my_secret_password"];

    // Update
    [keychainItem update:@"my_new_secret_password"];

    // Reset
    [keychainItem reset];
}

#pragma mark Delegates

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithResult:(NSDictionary *)result
{
    // Keychain value saved successfully
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithError:(NSError *)error
{
    // Keychain value not saved, error occurred
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithResult:(NSDictionary *)result
{
    // Keychain value received successfully
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithError:(NSError *)error
{
    // Keychain value not received, error occurred
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didUpdateValueWithResult:(NSDictionary *)result
{
    // Keychain value updated successfully
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didUpdateValueWithError:(NSError *)error
{
    // Keychain value not updated, error occurred
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didDeleteValueWithResult:(NSDictionary *)result
{
    // Keychain value deleted successfully
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didDeleteValueWithError:(NSError *)error
{
    // Keychain value not deleted, error occurred
}
```

#### Swift
```swift
let keychainItem = APSKeychainWrapper(identifier: "myaccount", service: "com.appcelerator.service", accessGroup: "$(AppIdentifierPrefix)com.appcelerator.keychain")

// Implement the APSKeychainWrapperDelegate in your class before
keychainItem.delegate = self

// Check existence asynchronously, since the result might be delayed by the user-interacton (e.g. Touch ID)
keychainItem.exists({ (success: Bool, error: Error?) in
    if (error != nil) {
        print("Error reading from keychain: \(error?.localizedDescription)")
        return
    }
    
    if success {
        self.keychainItem.read()
    }
})

// Read
keychainItem.read()

// Save
keychainItem.save("my_secret_password")

// Update
keychainItem.update("my_new_secret_password")

// Reset
keychainItem.reset()

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithError error: Error!) {
    // Keychain value not received, error occurred
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithError error: Error!) {
    // Keychain value not saved, error occurred
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithError error: Error!) {
    // Keychain value not deleted, error occurred
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithError error: Error!) {
    // Keychain value not updated, error occurred
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didReadValueWithResult result: [AnyHashable : Any]!) {
    // Keychain value received successfully
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didSaveValueWithResult result: [AnyHashable : Any]!) {
    // Keychain value saved successfully
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didDeleteValueWithResult result: [AnyHashable : Any]!) {
    // Keychain value deleted successfully
}

func apsKeychainWrapper(_ keychainWrapper: APSKeychainWrapper!, didUpdateValueWithResult result: [AnyHashable : Any]!) {
    // Keychain value updated successfully
}
```

### Author
Hans Knoechel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

### License
Apache 2.0

### Legal
This module is Copyright (c) 2016 by Axway. All Rights Reserved. Usage of this module is subject 
to the Terms of Service agreement with Axway, Inc.


### Contributing
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/appcelerator/APSKeychainWrapper/pull/new/master)!
