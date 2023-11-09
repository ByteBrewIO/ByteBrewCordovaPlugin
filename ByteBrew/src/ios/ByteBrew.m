/********* ByteBrew.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <ByteBrewNativeiOSPlugin/ByteBrewNativeiOSPlugin.h>

#ifndef ByteBrewProgressionType_h
#define ByteBrewProgressionType_h
typedef enum {
    Started,
    Completed,
    Failed
} ByteBrewProgressionType;

#endif /* ByteBrewProgressionType_h */

#ifndef ByteBrewAdType_h
#define ByteBrewAdType_h
typedef enum {
    Interstitial,
    Reward,
    Banner
} ByteBrewAdType;

#endif /* ByteBrewAdType_h */


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
- (void)addProgressionEvent:(CDVInvokedUrlCommand*)command;
- (void)addProgressionEventWithNumericValue:(CDVInvokedUrlCommand*)command;
- (void)addProgressionEventWithStringValue:(CDVInvokedUrlCommand*)command;
- (NSString*)byteBrewAdTypeToString:(ByteBrewAdType)adType;
- (void)newTrackedAdEvent:(CDVInvokedUrlCommand*)command;
- (void)newTrackedAdEventWithAdID:(CDVInvokedUrlCommand*)command;
- (void)newTrackedAdEventWithAdIDAndAdProvider:(CDVInvokedUrlCommand*)command;
- (void)newTrackedAdEventWithRevenue:(CDVInvokedUrlCommand*)command;
- (void)newTrackedAdEventWithRevenueAndLocation:(CDVInvokedUrlCommand*)command;
- (void)addTrackediOSInAppPurchaseEvent:(CDVInvokedUrlCommand*)command;
- (void)validateiOSInAppPurchaseEvent:(CDVInvokedUrlCommand*)command;
- (void)hasRemoteConfigs:(CDVInvokedUrlCommand*)command;
- (void)loadRemoteConfigs:(CDVInvokedUrlCommand*)command;
- (void)retrieveRemoteConfigs:(CDVInvokedUrlCommand*)command;
- (void)getUserID:(CDVInvokedUrlCommand*)command;
- (void)restartTracking:(CDVInvokedUrlCommand*)command;
- (void)stopTracking:(CDVInvokedUrlCommand*)command;
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

- (void)addProgressionEvent:(CDVInvokedUrlCommand*)command {
    int progressionStatus = [[command.arguments objectAtIndex:0] intValue];
    NSString* environment = [command.arguments objectAtIndex:1];
    NSString* stage = [command.arguments objectAtIndex:2];
    [ByteBrewNativeiOSPlugin AddProgressionEvent:progressionStatus Environment:environment Stage:stage];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addProgressionEventWithNumericValue:(CDVInvokedUrlCommand*)command {
    int progressionStatus = [[command.arguments objectAtIndex:0] intValue];
    NSString* environment = [command.arguments objectAtIndex:1];
    NSString* stage = [command.arguments objectAtIndex:2];
    Float64 value = [[command.arguments objectAtIndex:3] doubleValue];
    [ByteBrewNativeiOSPlugin AddProgressionEventWithNumericValue:progressionStatus Environment:environment Stage:stage Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addProgressionEventWithStringValue:(CDVInvokedUrlCommand*)command {
    int progressionStatus = [[command.arguments objectAtIndex:0] intValue];
    NSString* environment = [command.arguments objectAtIndex:1];
    NSString* stage = [command.arguments objectAtIndex:2];
    NSString* value = [command.arguments objectAtIndex:3];
    [ByteBrewNativeiOSPlugin AddProgressionEventWithStringValue:progressionStatus Environment:environment Stage:stage Value:value];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (NSString*)byteBrewAdTypeToString:(ByteBrewAdType)adType {
    switch (adType) {
        case Banner:
            return @"Banner";
        case Interstitial:
            return @"Interstitial";
        case Reward:
            return @"Reward";
        default:
            return @"Unknown";
    }
}

- (void)newTrackedAdEvent:(CDVInvokedUrlCommand*)command {
    int placementTypeInt = [[command.arguments objectAtIndex:0] intValue];
    ByteBrewAdType adType = (ByteBrewAdType)placementTypeInt;
    NSString* placementType = [self byteBrewAdTypeToString:adType];
    NSString* adLocation = [command.arguments objectAtIndex:1];
    [ByteBrewNativeiOSPlugin NewTrackedAdEvent:placementType AdLocation:adLocation];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)newTrackedAdEventWithAdID:(CDVInvokedUrlCommand*)command {
    int placementTypeInt = [[command.arguments objectAtIndex:0] intValue];
    ByteBrewAdType adType = (ByteBrewAdType)placementTypeInt;
    NSString* placementType = [self byteBrewAdTypeToString:adType];
    NSString* adLocation = [command.arguments objectAtIndex:1];
    NSString* adID = [command.arguments objectAtIndex:2];
    [ByteBrewNativeiOSPlugin NewTrackedAdEvent:placementType AdLocation:adLocation AdID:adID];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)newTrackedAdEventWithAdIDAndAdProvider:(CDVInvokedUrlCommand*)command {
    int placementTypeInt = [[command.arguments objectAtIndex:0] intValue];
    ByteBrewAdType adType = (ByteBrewAdType)placementTypeInt;
    NSString* placementType = [self byteBrewAdTypeToString:adType];
    NSString* adLocation = [command.arguments objectAtIndex:1];
    NSString* adID = [command.arguments objectAtIndex:2];
    NSString* adProvider = [command.arguments objectAtIndex:3];
    [ByteBrewNativeiOSPlugin NewTrackedAdEvent:placementType AdLocation:adLocation AdID:adID AdProvider:adProvider];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)newTrackedAdEventWithRevenue:(CDVInvokedUrlCommand*)command {
    int placementTypeInt = [[command.arguments objectAtIndex:0] intValue];
    ByteBrewAdType adType = (ByteBrewAdType)placementTypeInt;
    NSString* placementType = [self byteBrewAdTypeToString:adType];
    NSString* adProvider = [command.arguments objectAtIndex:1];
    NSString* adUnitName = [command.arguments objectAtIndex:2];
    Float64 revenue = [[command.arguments objectAtIndex:3] doubleValue];
    [ByteBrewNativeiOSPlugin NewTrackedAdEvent:placementType AdProvider:adProvider AdUnitName:adUnitName Revenue:revenue];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)newTrackedAdEventWithRevenueAndLocation:(CDVInvokedUrlCommand*)command {
    int placementTypeInt = [[command.arguments objectAtIndex:0] intValue];
    ByteBrewAdType adType = (ByteBrewAdType)placementTypeInt;
    NSString* placementType = [self byteBrewAdTypeToString:adType];
    NSString* adProvider = [command.arguments objectAtIndex:1];
    NSString* adUnitName = [command.arguments objectAtIndex:2];
    NSString* adLocation = [command.arguments objectAtIndex:3];
    Float64 revenue = [[command.arguments objectAtIndex:4] doubleValue];
    [ByteBrewNativeiOSPlugin NewTrackedAdEvent:placementType AdProvider:adProvider AdUnitName:adUnitName AdLocation:adLocation Revenue:revenue];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addTrackedInAppPurchaseEvent:(CDVInvokedUrlCommand*)command {
    NSString* store = [command.arguments objectAtIndex:0];
    NSString* currency = [command.arguments objectAtIndex:1];
    Float64 amount = [[command.arguments objectAtIndex:2] doubleValue];
    NSString* itemID = [command.arguments objectAtIndex:3];
    NSString* category = [command.arguments objectAtIndex:4];
    [ByteBrewNativeiOSPlugin AddTrackedInAppPurchaseEvent:store Currency:currency Amount:amount ItemID:itemID Category:category];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)addTrackediOSInAppPurchaseEvent:(CDVInvokedUrlCommand*)command {
    NSString* store = [command.arguments objectAtIndex:0];
    NSString* currency = [command.arguments objectAtIndex:1];
    Float64 amount = [[command.arguments objectAtIndex:2] doubleValue];
    NSString* itemID = [command.arguments objectAtIndex:3];
    NSString* category = [command.arguments objectAtIndex:4];
    NSString* receipt = [command.arguments objectAtIndex:5];
    [ByteBrewNativeiOSPlugin AddTrackediOSInAppPurchaseEvent:store Currency:currency Amount:amount ItemID:itemID Category:category Receipt:receipt];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)validateiOSInAppPurchaseEvent:(CDVInvokedUrlCommand*)command {
    NSString* store = [command.arguments objectAtIndex:0];
    NSString* currency = [command.arguments objectAtIndex:1];
    Float64 amount = [[command.arguments objectAtIndex:2] doubleValue];
    NSString* itemID = [command.arguments objectAtIndex:3];
    NSString* category = [command.arguments objectAtIndex:4];
    NSString* receipt = [command.arguments objectAtIndex:5];
    [ByteBrewNativeiOSPlugin ValidateiOSInAppPurchaseEvent:store Currency:currency Amount:amount ItemID:itemID Category:category Receipt:receipt finishedValidationResult:^(NSMutableDictionary* purchaseResult) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:purchaseResult];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)hasRemoteConfigs:(CDVInvokedUrlCommand*)command {
    BOOL hasRemoteConfigs = [ByteBrewNativeiOSPlugin HasRemoteConfigs];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:hasRemoteConfigs];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)loadRemoteConfigs:(CDVInvokedUrlCommand*)command {
    [ByteBrewNativeiOSPlugin LoadRemoteConfigs:^(BOOL success) {
        CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:success];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void)retrieveRemoteConfigs:(CDVInvokedUrlCommand*)command {
    NSString* key = [command.arguments objectAtIndex:0];
    NSString* defaultValue = [command.arguments objectAtIndex:1];
    NSString* remoteConfigValue = [ByteBrewNativeiOSPlugin RetrieveRemoteConfigs:key DefaultValue:defaultValue];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:remoteConfigValue];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)getUserID:(CDVInvokedUrlCommand*)command {
    NSString* userID = [ByteBrewNativeiOSPlugin GetUserID];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:userID];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)restartTracking:(CDVInvokedUrlCommand*)command {
    [ByteBrewNativeiOSPlugin RestartTracking];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopTracking:(CDVInvokedUrlCommand*)command {
    [ByteBrewNativeiOSPlugin StopTracking];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
