#import "CheckIfEmulatorPlugin.h"
#import <DTTJailbreakDetection/DTTJailbreakDetection.h>

@implementation CheckIfEmulatorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"check_if_emulator"
            binaryMessenger:[registrar messenger]];
  CheckIfEmulatorPlugin* instance = [[CheckIfEmulatorPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"isRealDevice" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[self isRealDevice]]);
  } else if ([@"isJailBroken" isEqualToString:call.method]) {
    result([NSNumber numberWithBool:[self isJailBroken]]);
  } else if ([@"developerMode" isEqualToString:call.method]) {
       result([NSNumber numberWithBool:[self isDevMode]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (BOOL)isJailBroken{
    /*if([self isOnMac]) {
        return false;
    }*/
    return [DTTJailbreakDetection isJailbroken];
}

- (BOOL)isDevMode{
    return false;
}

- (BOOL)isOnMac{
    BOOL isiOSAppOnMac = false;
    if (@available(iOS 14.0, *)) {
        isiOSAppOnMac = [NSProcessInfo processInfo].isiOSAppOnMac;
    }
    return isiOSAppOnMac;
}

- (BOOL) isRealDevice{
    return !TARGET_OS_SIMULATOR;
}
@end
