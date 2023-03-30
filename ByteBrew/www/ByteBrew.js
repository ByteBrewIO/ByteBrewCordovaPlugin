var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'ByteBrew', 'coolMethod', [arg0]);
};

//enums

exports.ByteBrewProgressionType = {
    Started: 0,
    Completed: 1,
    Failed: 2
};

exports.ByteBrewAdType = {
    Interstitial: 0,
    Reward: 1,
    Banner: 2
};

//init

exports.initializeWithSettings = function (gameID, secretKey, engineV, buildV, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "initializeWithSettings", [gameID, secretKey, engineV, buildV]);
};

exports.isByteBrewInitialized = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "isByteBrewInitialized", []);
};

exports.startPushNotifications = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "startPushNotifications", []);
};

//custom events

exports.addNewCustomEvent = function (eventName, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEvent", [eventName]);
};

exports.addNewCustomEventWithNumericValue = function (eventName, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEventWithNumericValue", [eventName, value]);
};

exports.addNewCustomEventWithStringValue = function (eventName, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEventWithStringValue", [eventName, value]);
};

//custom data

exports.addCustomDataAttributeWithStringValue = function (key, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addCustomDataAttributeWithStringValue", [key, value]);
};

exports.addCustomDataAttributeWithDoubleValue = function (key, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addCustomDataAttributeWithDoubleValue", [key, value]);
};

exports.addCustomDataAttributeWithIntegerValue = function (key, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addCustomDataAttributeWithIntegerValue", [key, value]);
};

exports.addCustomDataAttributeWithBooleanValue = function (key, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addCustomDataAttributeWithBooleanValue", [key, value]);
};

//progression

exports.addProgressionEvent = function (progressionStatus, environment, stage, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addProgressionEvent", [progressionStatus, environment, stage]);
};

exports.addProgressionEventWithNumericValue = function (progressionStatus, environment, stage, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addProgressionEventWithNumericValue", [progressionStatus, environment, stage, value]);
};

exports.addProgressionEventWithStringValue = function (progressionStatus, environment, stage, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addProgressionEventWithStringValue", [progressionStatus, environment, stage, value]);
};

//ads

exports.newTrackedAdEvent = function (placementType, adLocation, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "newTrackedAdEvent", [placementType, adLocation]);
};

exports.newTrackedAdEventWithAdID = function (placementType, adLocation, adID, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "newTrackedAdEventWithAdID", [placementType, adLocation, adID]);
};

exports.newTrackedAdEventWithAdIDAndAdProvider = function (placementType, adLocation, adID, adProvider, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "newTrackedAdEventWithAdIDAndAdProvider", [placementType, adLocation, adID, adProvider]);
};

//iap

exports.addTrackedInAppPurchaseEvent = function (store, currency, amount, itemID, category, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addTrackedInAppPurchaseEvent", [store, currency, amount, itemID, category]);
};

exports.addTrackediOSInAppPurchaseEvent = function (store, currency, amount, itemID, category, receipt, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addTrackediOSInAppPurchaseEvent", [store, currency, amount, itemID, category, receipt]);
};

exports.validateiOSInAppPurchaseEvent = function (store, currency, amount, itemID, category, receipt, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "validateiOSInAppPurchaseEvent", [store, currency, amount, itemID, category, receipt]);
};

exports.addTrackedGoogleInAppPurchaseEvent = function (store, currency, amount, itemID, category, receipt, signature, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addTrackedGoogleInAppPurchaseEvent", [store, currency, amount, itemID, category, receipt, signature]);
};

exports.validateGoogleInAppPurchaseEvent = function (store, currency, amount, itemID, category, receipt, signature, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "validateGoogleInAppPurchaseEvent", [store, currency, amount, itemID, category, receipt, signature]);
};

//remote configs

exports.hasRemoteConfigs = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "hasRemoteConfigs", []);
};

exports.loadRemoteConfigs = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "loadRemoteConfigs", []);
};

exports.retrieveRemoteConfigs = function (key, defaultValue, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "retrieveRemoteConfigs", [key, defaultValue]);
};

//misc

exports.getUserID = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "getUserID", []);
};

exports.restartTracking = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "restartTracking", []);
};

exports.stopTracking = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "stopTracking", []);
};
