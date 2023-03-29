var exec = require('cordova/exec');

exports.coolMethod = function (arg0, success, error) {
    exec(success, error, 'ByteBrew', 'coolMethod', [arg0]);
};

exports.initializeWithSettings = function (gameID, secretKey, engineV, buildV, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "initializeWithSettings", [gameID, secretKey, engineV, buildV]);
};

exports.isByteBrewInitialized = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "isByteBrewInitialized", []);
};

exports.startPushNotifications = function (successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "startPushNotifications", []);
};

exports.addNewCustomEvent = function (eventName, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEvent", [eventName]);
};

exports.addNewCustomEventWithNumericValue = function (eventName, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEventWithNumericValue", [eventName, value]);
};

exports.addNewCustomEventWithStringValue = function (eventName, value, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "ByteBrew", "addNewCustomEventWithStringValue", [eventName, value]);
};

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

// Add other methods following the same pattern
