# Fix Internet connection in Android Emulator
### step1: Change dns to 8.8.8.8
open your computer network config and change dns to 8.8.8.8
Screen Shot 2019-06-20 at 9.41.24 PM
### step2: restart simulator;

# Keyboard hide input
### Edit android manifest
Set `android:windowSoftInputMode="adjustPan"` in your manifest file, and it will work as you expect.
```android
<application
  android:name=".MainApplication"
  android:allowBackup="true"
  ...
  <activity
    android:name=".MainActivity"
    android:label="@string/app_name"
    ...
    android:windowSoftInputMode="adjustPan">
    ...
  </activity>
  ...
</application>
```
