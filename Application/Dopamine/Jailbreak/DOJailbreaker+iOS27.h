//
//  DOJailbreaker+iOS27.h
//  Dopamine
//
//  iOS 27 jailbreak functionality extension
//

#ifndef DOJailbreaker_iOS27_h
#define DOJailbreaker_iOS27_h

#import <Foundation/Foundation.h>

@interface DOJailbreaker (iOS27)

/**
 * Check if current device is running iOS 27
 * @return YES if device is running iOS 27, NO otherwise
 */
- (BOOL)isIOS27;

/**
 * Prepare exploit chain for iOS 27
 * @param error Output parameter for any errors
 * @return YES if preparation successful, NO otherwise
 */
- (BOOL)prepareExploitChainForIOS27:(NSError **)error;

/**
 * Execute jailbreak sequence specific to iOS 27
 * @param error Output parameter for any errors
 * @return YES if jailbreak successful, NO otherwise
 */
- (BOOL)executeJailbreakForIOS27:(NSError **)error;

/**
 * Validate iOS 27 environment before jailbreak
 * @param error Output parameter for any errors
 * @return YES if environment is valid, NO otherwise
 */
- (BOOL)validateIOS27Environment:(NSError **)error;

@end

#endif /* DOJailbreaker_iOS27_h */
