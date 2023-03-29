# How to Use
1. Download plugin.
2. Run:
```cmd
cordova plugin add /Path/To/Download/ByteBrew
```
3. Add the following to your project's config.xml file:
```xml
<feature name="ByteBrew">
  <param name="ios-package" value="ByteBrew" />
  <param name="android-package" value="com.bytebrew.cordovaplugin.ByteBrew" />
  <param name="onload" value="true" />
</feature>  
```
4. Call ByteBrew methods through javascript:
```js
ByteBrew.initializeWithSettings("GAME_KEY", "SECRET_KEY", "ENGINE_VERSION", "BUILD_VERSION");
```
