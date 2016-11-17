# APSKeychainWrapper

The `APSKeychainWrapper` is an Objective-C based wrapper to apply advanced access control 
to the iOS Keychain.

It's primary purpose for now is to be used in the Apcpelerator Titanium module [Ti.TouchID](https://github.com/appcelerator-modules/ti.touchid).

### Example

```objc
// Create a new keychain item instance
APSKeychainWrapper *keychainItem = [[[APSKeychainWrapper alloc] initWithIdentifier:@"mypassword"
                                                                           service:@"com.appcelerator.service"
                                                                       accessGroup:@"com.appcelerator.keychain"
                                                                 accessibilityMode:kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
                                                                 accessControlMode:kSecAccessControlTouchIDAny];

// Implement the APSKeychainWrapperDelegate in your class before
[keychainItem setDelegate:self];

// Check existence
BOOL *exists = [keychainItem exists];

// Read
[keychainItem read];

// Save
[keychainItem save:@"my_secret_password"];

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

-(void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithResult:(NSDictionary *)result
{
    // Keychain value received successfully
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithError:(NSError *)error
{
    // Keychain value not received, error occurred
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

### Contributing
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/APSKeychainWrapper/pull/new/master)!
