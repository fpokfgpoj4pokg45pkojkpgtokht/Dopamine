//
//  DOEnvironmentDetection.h
//  Dopamine
//
//  Created for iOS 27 support
//

#ifndef DOEnvironmentDetection_h
#define DOEnvironmentDetection_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DOEnvironmentDetection : NSObject

+ (instancetype)sharedDetection;

// OS Version Detection
- (BOOL)isIOS27OrLater;
- (BOOL)isIOS26;
- (BOOL)isIOS27;
- (NSString *)detectedIOSVersionString;

// Device Model Detection for iOS 27
- (BOOL)isSupported;
- (NSString *)deviceModelString;

// Architecture Detection
- (BOOL)supportsArm64e;
- (BOOL)supportsArm64;

@end

#endif /* DOEnvironmentDetection_h */
