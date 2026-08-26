//
//  DOEnvironmentDetection.m
//  Dopamine
//
//  Created for iOS 27 support
//

#import "DOEnvironmentDetection.h"
#import <sys/sysctl.h>

@interface DOEnvironmentDetection ()
@property (nonatomic, strong) NSOperatingSystemVersion currentOSVersion;
@end

@implementation DOEnvironmentDetection

+ (instancetype)sharedDetection {
    static DOEnvironmentDetection *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DOEnvironmentDetection alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.currentOSVersion = [[NSProcessInfo processInfo] operatingSystemVersion];
    }
    return self;
}

#pragma mark - OS Version Detection

- (BOOL)isIOS27OrLater {
    return self.currentOSVersion.majorVersion >= 27;
}

- (BOOL)isIOS26 {
    return self.currentOSVersion.majorVersion == 26;
}

- (BOOL)isIOS27 {
    return self.currentOSVersion.majorVersion == 27;
}

- (NSString *)detectedIOSVersionString {
    NSOperatingSystemVersion version = self.currentOSVersion;
    return [NSString stringWithFormat:@"iOS %ld.%ld.%ld", 
            (long)version.majorVersion, 
            (long)version.minorVersion, 
            (long)version.patchVersion];
}

#pragma mark - Device Support Detection

- (BOOL)isSupported {
    // iOS 27 support for modern devices
    NSUInteger majorVersion = self.currentOSVersion.majorVersion;
    
    // Support iOS 27 on all arm64e and arm64 devices
    if (majorVersion == 27) {
        return [self supportsArm64e] || [self supportsArm64];
    }
    
    // Legacy support for previous versions
    return NO;
}

- (NSString *)deviceModelString {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *model = [NSString stringWithUTF8String:machine];
    free(machine);
    return model;
}

#pragma mark - Architecture Detection

- (BOOL)supportsArm64e {
    // Check for arm64e architecture support
    size_t size;
    cpu_type_t cpuType;
    sysctlbyname("hw.cputype", &cpuType, &size, NULL, 0);
    
    cpu_subtype_t cpuSubtype;
    size = sizeof(cpuSubtype);
    sysctlbyname("hw.cpusubtype", &cpuSubtype, &size, NULL, 0);
    
    // Check for arm64e (CPU_SUBTYPE_ARM64E)
    return cpuType == CPU_TYPE_ARM64 && cpuSubtype == CPU_SUBTYPE_ARM64E;
}

- (BOOL)supportsArm64 {
    size_t size;
    cpu_type_t cpuType;
    sysctlbyname("hw.cputype", &cpuType, &size, NULL, 0);
    return cpuType == CPU_TYPE_ARM64;
}

@end
