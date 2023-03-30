# How to Use

1. Download plugin.

2. cd into your project root directory and run:

```cmd
cordova plugin add /Path/To/Downloaded/Folder/ByteBrew
```

3. Add the following to your project's config.xml file:

```xml
<feature name="ByteBrew">
  <param name="ios-package" value="ByteBrew" />
  <param name="android-package" value="com.bytebrew.cordovaplugin.ByteBrew" />
  <param name="onload" value="true" />
</feature>  
```
#### Note: steps 4-7 are iOS specific! Skip if not building for iOS.

4. Open your project's .xcworkspace file (/project_root/platforms/ios/ProjectName.xcworkspace) in Xcode.

5. Highlight your project root, then click on the target for your project, i.e. Targets > ProjectName.

6. Under the "Build Phases" section, click the plus (+) under Link Binary With Libraries, and add ByteBrew.xcframework. Close Xcode.

7. Remember to repeat steps 4-7 if you ever remove and re-add the ios platform for your project!

#### Nice job!

8. Ready to go! You can now call ByteBrew methods through javascript in Cordova:

```js
ByteBrew.initializeWithSettings("GAME_KEY", "SECRET_KEY", "ENGINE_VERSION", "BUILD_VERSION");
```

# Available Functions

```javascript
var platformString = window.cordova.platformId;
if (platformString == "ios") {
    console.log("Initializing ByteBrew for iOS");
    ByteBrew.initializeWithSettings("iOS_GAME_KEY", "iOS_SECRET_KEY", "cordova", "0.1");
} else if (platformString == "android") {
    console.log("Initializing ByteBrew for Android");
    ByteBrew.initializeWithSettings("ANDROID_GAME_KEY", "ANDROID_SECRET_KEY", "cordova", "0.1");
}
ByteBrew.isByteBrewInitialized((inited) => { console.log("ByteBrew is initialized: " + inited); });
ByteBrew.startPushNotifications();
ByteBrew.addNewCustomEvent("EVENT_NAME");
ByteBrew.addNewCustomEventWithNumericValue("EVENT_NAME", 0.5);
ByteBrew.addNewCustomEventWithStringValue("EVENT_NAME", "TestValue");
ByteBrew.addCustomDataAttributeWithStringValue("DATA_NAME", "StringValue");
ByteBrew.addCustomDataAttributeWithDoubleValue("DATA_NAME", 0.5);
ByteBrew.addCustomDataAttributeWithIntegerValue("DATA_NAME", 10);
ByteBrew.addCustomDataAttributeWithBooleanValue("DATA_NAME", true);
ByteBrew.addProgressionEvent(ByteBrew.ByteBrewProgressionType.Started, "ENVIRONMENT", "STAGE");
ByteBrew.addProgressionEventWithNumericValue(ByteBrew.ByteBrewProgressionType.Started, "ENVIRONMENT", "STAGE", 0.5);
ByteBrew.addProgressionEventWithStringValue(ByteBrew.ByteBrewProgressionType.Started, "ENVIRONMENT", "STAGE", "TestValue");
ByteBrew.newTrackedAdEvent(ByteBrew.ByteBrewAdType.Reward);
ByteBrew.newTrackedAdEventWithAdID(ByteBrew.ByteBrewAdType.Reward, "TestAdID");
ByteBrew.newTrackedAdEventWithAdIDAndAdProvider(ByteBrew.ByteBrewAdType.Reward, "TestAdID", "TestAdProvider");
ByteBrew.addTrackedInAppPurchaseEvent("TestStore", "USD", 0.5, "TestItemID", "TestCategory");
ByteBrew.addTrackediOSInAppPurchaseEvent("TestStore", "USD", 0.5, "TestItemID", "TestCategory", "TestReceipt");
ByteBrew.validateiOSInAppPurchaseEvent("TestStore", "USD", 0.5, "TestItemID", "TestCategory", "TestReceipt",
    (result) => {
        console.log("Validation complete: " + JSON.stringify(result));
        //result.isValid
        //result.purchaseProcessed
        //result.itemID
        //result.timestamp
        //result.message
    }
);
ByteBrew.addTrackedGoogleInAppPurchaseEvent("TestStore", "USD", 0.5, "TestItemID", "TestCategory", "TestReceipt", "TestSignature");
ByteBrew.validateGoogleInAppPurchaseEvent("TestStore", "USD", 0.5, "TestItemID", "TestCategory", "TestReceipt", "TestSignature",
    (result) => {
        console.log("Validation complete: " + JSON.stringify(result));
        //result.isValid
        //result.purchaseProcessed
        //result.itemID
        //result.timestamp
        //result.message
    }
);
ByteBrew.hasRemoteConfigs((hasConfigs) => { console.log("Has remote configs: " + hasConfigs); });
ByteBrew.loadRemoteConfigs();
ByteBrew.retrieveRemoteConfigs("REMOTE_CONFIG_KEY", "DEFAULT_VALUE", (config) => { console.log("Remote config value: " + config); });
ByteBrew.getUserID((userID) => { console.log("User ID: " + userID); });
ByteBrew.restartTracking();
ByteBrew.stopTracking();
```
