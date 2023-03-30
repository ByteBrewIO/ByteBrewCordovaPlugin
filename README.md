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
4. Open your project's .xcworkspace file in /project_root/platforms/ios/ProjectName.xcworkspace.
5. Click on the target for your project, i.e. Targets > ProjectName.
6. Under the "Build Phases" section, click the plus (+) under Link Binary With Libraries, and add ByteBrew.xcframework. Close XCode.
7. Remember to repeat steps 4-7 if you ever remove and re-add the ios platform for your project!
#### Nice job!
8. Ready to go! Call ByteBrew methods through javascript:
```js
ByteBrew.initializeWithSettings("GAME_KEY", "SECRET_KEY", "ENGINE_VERSION", "BUILD_VERSION");
```
