//
//  DOJailbreakButton+iOS27.m
//  Dopamine
//
//  iOS 27 support extension for jailbreak button
//

#import "DOJailbreakButton.h"
#import "DOEnvironmentDetection.h"

@implementation DOJailbreakButton (iOS27)

- (void)configureForIOS27 {
    // iOS 27 specific button configuration
    if ([[DOEnvironmentDetection sharedDetection] isIOS27]) {
        // Enhanced visual feedback for iOS 27
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.15;
        self.layer.shadowOffset = CGSizeMake(0, 2);
        self.layer.shadowRadius = 8;
        
        // Haptic feedback support for iOS 27
        if (@available(iOS 13, *)) {
            UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
            [generator impactOccurred];
        }
    }
}

- (void)prepareForJailbreakOnIOS27 {
    // Pre-jailbreak setup for iOS 27
    if (![[DOEnvironmentDetection sharedDetection] isIOS27]) {
        return;
    }
    
    // Disable interactions during jailbreak process
    self.userInteractionEnabled = NO;
    
    // Add iOS 27 specific animation
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0;
    scaleAnimation.toValue = @0.98;
    scaleAnimation.duration = 0.1;
    scaleAnimation.autoreverses = YES;
    [self.layer addAnimation:scaleAnimation forKey:@"jailbreakButtonScale"];
}

@end
