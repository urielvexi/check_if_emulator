#import "CheckIfEmulatorPlugin.h"

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
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (BOOL) isRealDevice{
    return !TARGET_OS_SIMULATOR;
}
@end
