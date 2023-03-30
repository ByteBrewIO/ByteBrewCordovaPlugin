package com.bytebrew.cordovaplugin;

import org.apache.cordova.CordovaPlugin;

import java.io.Console;
import java.util.Dictionary;
import java.util.Hashtable;
import java.util.HashMap;
import java.util.Map;

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
        } else if (action.equals("addProgressionEvent")) {
            com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus = com.bytebrew.bytebrewlibrary.ByteBrewProgressionType
                    .values()[args.getInt(0)];
            String environment = args.getString(1);
            String stage = args.getString(2);
            this.addProgressionEvent(progressionStatus, environment, stage, callbackContext);
            return true;
        } else if (action.equals("addProgressionEventWithNumericValue")) {
            com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus = com.bytebrew.bytebrewlibrary.ByteBrewProgressionType
                    .values()[args.getInt(0)];
            String environment = args.getString(1);
            String stage = args.getString(2);
            int value = args.getInt(3);
            this.addProgressionEventWithNumericValue(progressionStatus, environment, stage, value, callbackContext);
            return true;
        } else if (action.equals("addProgressionEventWithStringValue")) {
            com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus = com.bytebrew.bytebrewlibrary.ByteBrewProgressionType
                    .values()[args.getInt(0)];
            String environment = args.getString(1);
            String stage = args.getString(2);
            String value = args.getString(3);
            this.addProgressionEventWithStringValue(progressionStatus, environment, stage, value, callbackContext);
            return true;
        } else if (action.equals("newTrackedAdEvent")) {
            com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType = com.bytebrew.bytebrewlibrary.ByteBrewAdType
                    .values()[args.getInt(0)];
            String adLocation = args.getString(1);
            this.newTrackedAdEvent(placementType, adLocation, callbackContext);
            return true;
        } else if (action.equals("newTrackedAdEventWithAdID")) {
            com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType = com.bytebrew.bytebrewlibrary.ByteBrewAdType
                    .values()[args.getInt(0)];
            String adLocation = args.getString(1);
            String adID = args.getString(2);
            this.newTrackedAdEventWithAdID(placementType, adLocation, adID, callbackContext);
            return true;
        } else if (action.equals("newTrackedAdEventWithAdIDAndAdProvider")) {
            com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType = com.bytebrew.bytebrewlibrary.ByteBrewAdType
                    .values()[args.getInt(0)];
            String adLocation = args.getString(1);
            String adID = args.getString(2);
            String adProvider = args.getString(3);
            this.newTrackedAdEventWithAdIDAndAdProvider(placementType, adLocation, adID, adProvider, callbackContext);
            return true;
        } else if (action.equals("addTrackedInAppPurchaseEvent")) {
            String store = args.getString(0);
            String currency = args.getString(1);
            float amount = (float) args.getDouble(2);
            String itemID = args.getString(3);
            String category = args.getString(4);
            this.addTrackedInAppPurchaseEvent(store, currency, amount, itemID, category, callbackContext);
            return true;
        } else if (action.equals("addTrackedGoogleInAppPurchaseEvent")) {
            String store = args.getString(0);
            String currency = args.getString(1);
            float amount = (float) args.getDouble(2);
            String itemID = args.getString(3);
            String category = args.getString(4);
            String receipt = args.getString(5);
            String signature = args.getString(6);
            this.addTrackedGoogleInAppPurchaseEvent(store, currency, amount, itemID, category, receipt, signature,
                    callbackContext);
        } else if (action.equals("validateGoogleInAppPurchaseEvent")) {
            String store = args.getString(0);
            String currency = args.getString(1);
            float amount = (float) args.getDouble(2);
            String itemID = args.getString(3);
            String category = args.getString(4);
            String receipt = args.getString(5);
            String signature = args.getString(6);
            this.validateGoogleInAppPurchaseEvent(store, currency, amount, itemID, category, receipt, signature,
                    callbackContext);
            return true;
        } else if (action.equals("hasRemoteConfigs")) {
            this.hasRemoteConfigs(callbackContext);
            return true;
        } else if (action.equals("loadRemoteConfigs")) {
            this.loadRemoteConfigs(callbackContext);
            return true;
        } else if (action.equals("retrieveRemoteConfigs")) {
            String key = args.getString(0);
            String defaultValue = args.getString(1);
            this.retrieveRemoteConfigs(key, defaultValue, callbackContext);
            return true;
        } else if (action.equals("getUserID")) {
            this.getUserID(callbackContext);
            return true;
        } else if (action.equals("restartTracking")) {
            this.restartTracking(callbackContext);
            return true;
        } else if (action.equals("stopTracking")) {
            this.stopTracking(callbackContext);
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

    private void initializeWithSettings(String gameID, String secretKey, String engineVersion, String buildVersion,
            CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.InitializeByteBrew(gameID, secretKey, engineVersion,
                cordova.getActivity().getApplicationContext());
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

    private void addProgressionEvent(com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus,
            String environment, String stage,
            CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewProgressionEvent(progressionStatus, environment, stage);
    }

    private void addProgressionEventWithNumericValue(
            com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus, String environment,
            String stage, float value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewProgressionEvent(progressionStatus, environment, stage, value);
    }

    private void addProgressionEventWithStringValue(
            com.bytebrew.bytebrewlibrary.ByteBrewProgressionType progressionStatus, String environment,
            String stage, String value, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.NewProgressionEvent(progressionStatus, environment, stage, value);
    }

    private void newTrackedAdEvent(com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType, String adLocation,
            CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.TrackAdEvent(placementType, adLocation);
    }

    private void newTrackedAdEventWithAdID(com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType, String adLocation,
            String adID,
            CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.TrackAdEvent(placementType, adLocation, adID);
    }

    private void newTrackedAdEventWithAdIDAndAdProvider(com.bytebrew.bytebrewlibrary.ByteBrewAdType placementType,
            String adLocation, String adID,
            String adProvider, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.TrackAdEvent(placementType, adLocation, adID, adProvider);
    }

    private void addTrackedInAppPurchaseEvent(String store, String currency, float amount, String itemID,
            String category, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.TrackInAppPurchaseEvent(store, currency, amount, itemID, category);
    }

    private void addTrackedGoogleInAppPurchaseEvent(String store, String currency, float amount, String itemID,
            String category, String receipt, String signature, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.TrackGoogleInAppPurchaseEvent(store, currency, amount, itemID, category,
                receipt, signature);
    }

    private void validateGoogleInAppPurchaseEvent(String store, String currency, float amount, String itemID,
            String category, String receipt, String signature, CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.PurchaseResponseListener listener = new com.bytebrew.bytebrewlibrary.PurchaseResponseListener() {
            @Override
            public void purchaseValidated(com.bytebrew.bytebrewlibrary.ByteBrewPurchaseResult result) {
                Map<String, Object> map = new HashMap<String, Object>();
                // Use getters if available or request library author to provide them
                map.put("purchaseValid", result.isPurchaseValid());
                map.put("purchaseProcessed", result.isPurchaseProcessed());
                map.put("itemID", result.getItemID());
                map.put("validationTime", result.getValidationTime());
                map.put("message", result.getMessage());
                JSONObject json = new JSONObject(map);
                callbackContext.success(json);
            }
        };
        com.bytebrew.bytebrewlibrary.ByteBrew.ValidateGoogleInAppPurchaseEvent(store, currency, amount, itemID,
                category, receipt, signature, listener);
    }

    private void hasRemoteConfigs(CallbackContext callbackContext) {
        callbackContext.success(com.bytebrew.bytebrewlibrary.ByteBrew.HasRemoteConfigsBeenSet() ? "true" : "false");
    }

    private void loadRemoteConfigs(CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.RemoteConfigListener listener = new com.bytebrew.bytebrewlibrary.RemoteConfigListener() {
            @Override
            public void RetrievedConfigs(boolean status) {
                callbackContext.success(status ? "true" : "false");
            }
        };
        com.bytebrew.bytebrewlibrary.ByteBrew.LoadRemoteConfigs(listener);
    }

    private void retrieveRemoteConfigs(String key, String defaultValue, CallbackContext callbackContext) {
        callbackContext.success(com.bytebrew.bytebrewlibrary.ByteBrew.RetrieveRemoteConfigValue(key, defaultValue));
    }

    private void getUserID(CallbackContext callbackContext) {
        callbackContext.success(com.bytebrew.bytebrewlibrary.ByteBrew.GetUserID());
    }

    private void restartTracking(CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.RestartTracking(cordova.getActivity().getApplicationContext());
    }

    private void stopTracking(CallbackContext callbackContext) {
        com.bytebrew.bytebrewlibrary.ByteBrew.StopTracking(cordova.getActivity().getApplicationContext());
    }

}
