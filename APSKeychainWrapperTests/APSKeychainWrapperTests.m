/**
 * APSKeychainWrapper
 * Copyright (c) 2016 by Axway. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import <XCTest/XCTest.h>
#import "APSKeychainWrapper.h"

NSString * const kAPSKeychainWrapperIdentifier = @"password";
NSString * const kAPSKeychainWrapperService = @"ti.touchid";
NSString * const kAPSKeychainWrapperAccessGroup = @"com.appcelerator.keychainwrapper";

@interface APSKeychainWrapperTests : XCTestCase <APSKeychainWrapperDelegate>
@property(nonatomic, strong, readwrite) APSKeychainWrapper *keychainItem;
@end

@implementation APSKeychainWrapperTests

- (void)setUp
{
    [super setUp];

    self.keychainItem = [[APSKeychainWrapper alloc] initWithIdentifier:kAPSKeychainWrapperIdentifier
                                                               service:kAPSKeychainWrapperService
                                                           accessGroup:kAPSKeychainWrapperAccessGroup];
    
    self.keychainItem.delegate = self;
}

- (void)tearDown
{
    self.keychainItem.delegate = nil;
    
    [super tearDown];
}

- (void)testSaveToKeychain
{
    XCTAssertNotNil(self.keychainItem, @"Keychain item is nil");
    XCTAssertTrue([self.keychainItem respondsToSelector:@selector(save:)], @"Selector save: not found");
    
    [self.keychainItem save:@"secret_password"];
}

- (void)testReadFromKeychain
{
    XCTAssertNotNil(self.keychainItem, @"Keychain item is nil");
    XCTAssertTrue([self.keychainItem respondsToSelector:@selector(read)], @"Selector save: not found");
    
    [self.keychainItem read];
}

- (void)testUpdateToKeychain
{
    XCTAssertNotNil(self.keychainItem, @"Keychain item is nil");
    XCTAssertTrue([self.keychainItem respondsToSelector:@selector(update:)], @"Selector save: not found");
    
    [self.keychainItem update:@"new password"];
}

- (void)testDeleteFromKeychain
{
    XCTAssertNotNil(self.keychainItem, @"Keychain item is nil");
    XCTAssertTrue([self.keychainItem respondsToSelector:@selector(reset)], @"Selector save: not found");
    
    [self.keychainItem reset];
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithResult:(NSDictionary *)result
{
    XCTAssertNotNil(result, "Keychain item result is empty");
    XCTAssertTrue([result isKindOfClass:[NSDictionary class]], "Result is not a dictionary");
    XCTAssertEqual([[result allKeys] count], 1, @"Result is not length = 1");
    
    XCTAssertNotNil([result objectForKey:@"success"], "Keychain key \"success\" item result is nil");
    XCTAssertTrue([result objectForKey:@"success"], "Keychain key \"success\" item result is not true");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper *)keychainWrapper didSaveValueWithError:(NSError *)error
{
    XCTAssertNil(error, @"Error is non-nil");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didUpdateValueWithResult:(NSDictionary*)result
{
    XCTAssertNotNil(result, "Keychain item result is empty");
    XCTAssertTrue([result isKindOfClass:[NSDictionary class]], "Result is not a dictionary");
    XCTAssertEqual([[result allKeys] count], 1, @"Result is not length = 1");

    XCTAssertNotNil([result objectForKey:@"success"], "Keychain key \"success\" item result is nil");
    XCTAssertTrue([result objectForKey:@"success"], "Keychain key \"success\" item result is not true");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didUpdateValueWithError:(NSError*)error
{
    XCTAssertNil(error, @"Error is non-nil");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didReadValueWithResult:(NSDictionary*)result
{
    XCTAssertNotNil(result, "Keychain item result is empty");
    XCTAssertTrue([result isKindOfClass:[NSDictionary class]], "Result is not a dictionary");
    XCTAssertEqual([[result allKeys] count], 1, @"Result is not length = 1");
    
    XCTAssertNotNil([result objectForKey:@"success"], "Keychain key \"success\" item result is nil");
    XCTAssertTrue([result objectForKey:@"success"], "Keychain key \"success\" item result is not true");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didReadValueWithError:(NSError*)error
{
    XCTAssertNil(error, @"Error is non-nil");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didDeleteValueWithResult:(NSDictionary*)result
{
    XCTAssertNotNil(result, "Keychain item result is empty");
    XCTAssertTrue([result isKindOfClass:[NSDictionary class]], "Result is not a dictionary");
    XCTAssertEqual([[result allKeys] count], 1, @"Result is not length = 1");
    
    XCTAssertNotNil([result objectForKey:@"success"], "Keychain key \"success\" item result is nil");
    XCTAssertTrue([result objectForKey:@"success"], "Keychain key \"success\" item result is not true");
}

- (void)APSKeychainWrapper:(APSKeychainWrapper*)keychainWrapper didDeleteValueWithError:(NSError*)error
{
    XCTAssertNil(error, @"Error is non-nil");
}

@end
