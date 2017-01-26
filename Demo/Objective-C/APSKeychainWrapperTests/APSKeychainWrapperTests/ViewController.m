//
//  ViewController.m
//  APSKeychainWrapperTests
//
//  Created by Hans Knoechel on 21/11/2016.
//  Copyright © 2016 Appcelerator. All rights reserved.
//

#import "ViewController.h"
#import "APSKeychainWrapper.h"

@interface ViewController () <APSKeychainWrapperDelegate>
@property(nonatomic,strong) APSKeychainWrapper* keychainItem;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _keychainItem = [[APSKeychainWrapper alloc] initWithIdentifier:@"password"
                                                               service:@"myservice"
                                                           accessGroup:@"$(AppIdentifierPrefix)com.appcelerator.APSKeychainWrapperTests"];
    
    [_keychainItem setDelegate:self];
}

- (IBAction)saveToKeychain {
    [_keychainItem save:@"my_secret_password"];
}

- (IBAction)readFromKeychain {
    [_keychainItem exists:^(BOOL exists, NSError *error) {
        if (error) {
            NSLog(@"Error reading from keychain: %@", [error localizedDescription]);
            return;
        }
        
        if (exists) {
            [_keychainItem read];
        }
    }];
}

- (IBAction)updateToKeychain {
    [_keychainItem update:@"my_new_password"];
}

- (IBAction)deleteFromKeychain {
    [_keychainItem reset];
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithError:(NSError *)error {
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didReadValueWithResult:(NSDictionary *)result {

}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithError:(NSError *)error {
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithResult:(NSDictionary *)result {
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didUpdateValueWithError:(NSError *)error {
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didUpdateValueWithResult:(NSDictionary *)result {
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didDeleteValueWithError:(NSError *)error
{
    
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didDeleteValueWithResult:(NSDictionary *)result {
    
}

@end
