//
//  DOMainViewController+iOS27.m
//  Dopamine
//
//  iOS 27 support extension for main view controller
//

#import "DOMainViewController.h"
#import "DOEnvironmentDetection.h"

@implementation DOMainViewController (iOS27)

- (void)setupIOS27StatusMessage {
    // Display iOS 27 detection message
    if ([[DOEnvironmentDetection sharedDetection] isIOS27]) {
        DOUIManager *uiManager = [DOUIManager sharedInstance];
        NSString *versionString = [[DOEnvironmentDetection sharedDetection] detectedIOSVersionString];
        NSString *deviceModel = [[DOEnvironmentDetection sharedDetection] deviceModelString];
        
        NSString *statusMessage = [NSString stringWithFormat:@"Detected %@ on %@", versionString, deviceModel];
        [uiManager sendLog:statusMessage debug:YES];
    }
}

- (BOOL)validateDeviceSupportForIOS27 {
    DOEnvironmentDetection *detection = [DOEnvironmentDetection sharedDetection];
    
    if (![detection isIOS27]) {
        return NO;
    }
    
    // Check device support
    if (![detection isSupported]) {
        return NO;
    }
    
    // Validate architecture
    if (![detection supportsArm64e] && ![detection supportsArm64]) {
        return NO;
    }
    
    return YES;
}

- (void)prepareJailbreakUIForIOS27 {
    if (![[DOEnvironmentDetection sharedDetection] isIOS27]) {
        return;
    }
    
    // iOS 27 specific UI adjustments
    if (@available(iOS 13, *)) {
        // Modern UI adjustments for iOS 27
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    // Set up proper safe area handling for iOS 27
    if (@available(iOS 11, *)) {
        self.view.insetsLayoutMarginsFromSafeArea = YES;
    }
}

@end
