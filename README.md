# 🔐 APSKeychainWrapper

The `APSKeychainWrapper` is an Objective-C based wrapper to apply advanced access control 
to the iOS Keychain.

It's primary purpose for now is to be used in the Apcpelerator Titanium module [Ti.TouchID](https://github.com/appcelerator-modules/ti.touchid).

### Example

```objc
// Create a new keychain item instance
APSKeychainWrapper *keychainItem = [[[APSKeychainWrapper alloc] initWithIdentifier:@"myaccount"
                                                                           service:@"com.appcelerator.service"
                                                                       accessGroup:@"com.appcelerator.keychain"
                                                                 accessibilityMode:kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
                                                                 accessControlMode:kSecAccessControlTouchIDAny
                                                                           options:@{@"u_OpPrompt": @"Please authenticate yourself before"}];

// Implement the APSKeychainWrapperDelegate in your class before
[keychainItem setDelegate:self];

// Check existence asynchronously, since the result might be
// delayed by the user-interacton (e.g. Touch ID)
[keychainItem exists:^(BOOL result) {
    NSLog(@"Does item exist: %lu", result);
}];

// Read
[keychainItem read];

// Save
[keychainItem save:@"my_secret_password"];

// Update
[keychainItem update:@"my_new_secret_password"];

// Reset
[keychainItem reset];

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


### Author
Hans Knoechel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

### License
Apache 2.0

### Legal
This module is Copyright (c) 2016 by Axway. All Rights Reserved. Usage of this module is subject 
to the Terms of Service agreement with Axway, Inc.


### Contributing
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/appcelerator/APSKeychainWrapper/pull/new/master)!
