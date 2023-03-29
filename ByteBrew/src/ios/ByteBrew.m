/********* ByteBrew.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <ByteBrewNativeiOSPlugin/ByteBrewNativeiOSPlugin.h>

@interface ByteBrew : CDVPlugin {
  // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
- (void)initializeWithSettings:(CDVInvokedUrlCommand*)command;
- (void)isByteBrewInitialized:(CDVInvokedUrlCommand*)command;
- (void)startPushNotifications:(CDVInvokedUrlCommand*)command;
- (void)addNewCustomEvent:(CDVInvokedUrlCommand*)command;
- (void)addNewCustomEventWithNumericValue:(CDVInvokedUrlCommand*)command;
- (void)addNewCustomEventWithStringValue:(CDVInvokedUrlCommand*)command;
- (void)addCustomDataAttributeWithStringValue:(CDVInvokedUrlCommand*)command;
- (void)addCustomDataAttributeWithDoubleValue:(CDVInvokedUrlCommand*)command;
- (void)addCustomDataAttributeWithIntegerValue:(CDVInvokedUrlCommand*)command;
- (void)addCustomDataAttributeWithBooleanValue:(CDVInvokedUrlCommand*)command;
@end

@implementation ByteBrew

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];

    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)initializeWithSettings:(CDVInvokedUrlCommand*)command {
    NSString* gameID = [command.arguments objectAtIndex:0];
    NSString* secretKey = [command.arguments objectAtIndex:1];
    NSString* engineV = [command.arguments objectAtIndex:2];
    NSString* buildV = [command.arguments objectAtIndex:3];

    [ByteBrewNativeiOSPlugin InitializeWithSettings:gameID SecretKey:secretKey EngineVersion:engineV BuildVersion:buildV];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isByteBrewInitialized:(CDVInvokedUrlCommand*)command {
    BOOL isInitialized = [ByteBrewNativeiOSPlugin IsByteBrewInitialized];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isInitialized];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)startPushNotifications:(CDVInvokedUrlCommand*)command {
    [ByteBrewNativeiOSPlugin StartPushNotification];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addNewCustomEvent:(CDVInvokedUrlCommand*)command {
    NSString* eventName = [command.arguments objectAtIndex:0];
    [ByteBrewNativeiOSPlugin AddNewCustomEvent:eventName];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addNewCustomEventWithNumericValue:(CDVInvokedUrlCommand*)command {
    NSString* eventName = [command.arguments objectAtIndex:0];
    Float64 value = [[command.arguments objectAtIndex:1] doubleValue];
    [ByteBrewNativeiOSPlugin AddNewCustomEventWithNumericValue:eventName Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addNewCustomEventWithStringValue:(CDVInvokedUrlCommand*)command {
    NSString* eventName = [command.arguments objectAtIndex:0];
    NSString* value = [command.arguments objectAtIndex:1];
    [ByteBrewNativeiOSPlugin AddNewCustomEventWithStringValue:eventName Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addCustomDataAttributeWithStringValue:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* value = [command.arguments objectAtIndex:1];
    [ByteBrewNativeiOSPlugin AddCustomDataAttributeWithStringValue:key Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addCustomDataAttributeWithDoubleValue:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    double value = [[command.arguments objectAtIndex:1] doubleValue];
    [ByteBrewNativeiOSPlugin AddCustomDataAttributeWithDoubleValue:key Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addCustomDataAttributeWithIntegerValue:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    int value = [[command.arguments objectAtIndex:1] intValue];
    [ByteBrewNativeiOSPlugin AddCustomDataAttributeWithIntegerValue:key Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addCustomDataAttributeWithBooleanValue:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    BOOL value = [[command.arguments objectAtIndex:1] boolValue];
    [ByteBrewNativeiOSPlugin AddCustomDataAttributeWithBooleanValue:key Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
