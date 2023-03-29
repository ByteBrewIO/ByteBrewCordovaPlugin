package com.bytebrew.cordovaplugin;

import org.apache.cordova.CordovaPlugin;

import java.io.Console;

import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class ByteBrew extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("coolMethod")) {
            String message = args.getString(0);
            this.coolMethod(message, callbackContext);
            return true;
        } else if (action.equals("initializeWithSettings")) {
            String gameID = args.getString(0);
            String secretKey = args.getString(1);
            String engineVersion = args.getString(2);
            String buildVersion = args.getString(3);
            this.initializeWithSettings(gameID, secretKey, engineVersion, buildVersion, callbackContext);
            return true;
        } else if (action.equals("isByteBrewInitialized")) {
            this.isByteBrewInitialized(callbackContext);
            return true;
        } else if (action.equals("startPushNotifications")) {
            this.startPushNotifications(callbackContext);
            return true;
        } else if (action.equals("addNewCustomEvent")) {
            String eventName = args.getString(0);
            this.addNewCustomEvent(eventName, callbackContext);
            return true;
        } else if (action.equals("addNewCustomEventWithNumericValue")) {
            String eventName = args.getString(0);
            float value = (float) args.getDouble(1);
            this.addNewCustomEventWithNumericValue(eventName, value, callbackContext);
            return true;
        } else if (action.equals("addNewCustomEventWithStringValue")) {
            String eventName = args.getString(0);
            String value = args.getString(1);
            this.addNewCustomEventWithStringValue(eventName, value, callbackContext);
            return true;
        } else if (action.equals("addCustomDataAttributeWithStringValue")) {
            String key = args.getString(0);
            String value = args.getString(1);
            this.addCustomDataAttributeWithStringValue(key, value, callbackContext);
            return true;
        } else if (action.equals("addCustomDataAttributeWithDoubleValue")) {
            String key = args.getString(0);
            double value = args.getDouble(1);
            this.addCustomDataAttributeWithDoubleValue(key, value, callbackContext);
            return true;
        } else if (action.equals("addCustomDataAttributeWithIntegerValue")) {
            String key = args.getString(0);
            int value = args.getInt(1);
            this.addCustomDataAttributeWithIntegerValue(key, value, callbackContext);
            return true;
        } else if (action.equals("addCustomDataAttributeWithBooleanValue")) {
            String key = args.getString(0);
            boolean value = args.getBoolean(1);
            this.addCustomDataAttributeWithBooleanValue(key, value, callbackContext);
            return true;
        }
        return false;
    }

    private void coolMethod(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }

    private void initializeWithSettings(String gameID, String secretKey, String engineVersion, String buildVersion, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.InitializeByteBrew(gameID, secretKey, engineVersion, cordova.getActivity().getApplicationContext());
    }

    private void isByteBrewInitialized(CallbackContext callbackContext) {
        boolean inited = com.bytebrew.bytebrewlibrary.ByteBrew.IsByteBrewInitialized();
        callbackContext.success(inited ? "true" : "false");
    }

    private void startPushNotifications(CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.StartPushNotifications(cordova.getActivity().getApplicationContext());
    }

    private void addNewCustomEvent(String eventName, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewCustomEvent(eventName);
    }

    private void addNewCustomEventWithNumericValue(String eventName, float value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewCustomEvent(eventName, value);
    }

    private void addNewCustomEventWithStringValue(String eventName, String value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewCustomEvent(eventName, value);
    }

    private void addCustomDataAttributeWithStringValue(String key, String value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.SetCustomData(key, value);
    }

    private void addCustomDataAttributeWithDoubleValue(String key, double value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.SetCustomData(key, value);
    }

    private void addCustomDataAttributeWithIntegerValue(String key, int value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.SetCustomData(key, value);
    }

    private void addCustomDataAttributeWithBooleanValue(String key, boolean value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.SetCustomData(key, value);
    }

}
