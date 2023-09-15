# Towards Enhancing Low Vision Usability of Data Charts on Smartphones

## Recommended 
----
#### IDE 

[Visual Studio Code](https://code.visualstudio.com/)

##### Plugis for **Visual Studio Code**
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)
- [Pubspec Assist](https://marketplace.visualstudio.com/items?itemName=jeroen-meijer.pubspec-assist)
- [Color Highlight](https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight)

##### Configuration

- Dart Line Length Configuration
![Dart: Line Length Configuration](https://i.imgur.com/DrT5MAe.png)

---

## Linting
All linting options need to be added to `analysis_options.yaml`. This is present in the root directory of the project 

```
floatingbubble/
|- analysis_options.yaml
```

## Getting Started

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/anonymous284012/GraphLite
```

**Step 2:**

Go to project root and execute the following commands in console to get the required dependencies: 

``` 
flutter pub get
flutter pub upgrade
```

### Building a release APK

Go to project root and execute the following commands in console to clean build the release APK: 

``` 
flutter clean
flutter build appbundle --target-platform android-arm,android-arm64
```

### Before you push a commmit

* Make sure that all the code is commented and legible variable names are used. Do not have any unnecessary overheads or redundant code.
* The code is formatted using the in-built dart formatter for the respective IDE being used with commas (,) placed at the appropriate positions to enhance readability.
* All local imports are replaced with the complete path to the file (example :- `import 'package:floatingbubble/constants/enums.dart';`)
* Always import flutter core libaries, followed by any external library and then the local files in the end.

### When to create a new Branch

A new branch is to be created for new feature with an appropriate name. For example, when adding the video-conferencing feature, one should create a new branch from the main branch named floatingbubble-customtheme (There is no set naming nomenclature that one has to follow. Just use legible branch name)

### When to merge a branch

![When to merge a branch](https://i.imgur.com/t4qSgnA.png)

### Libraries & Tools Used

* [In-App Webview](https://github.com/pichillilorenzo/flutter_inappwebview)
* [Multi-select Flutter](https://pub.dev/packages/multi_select_flutter)
* [HTTP](https://pub.dev/packages/http)
* [Crypto](https://pub.dev/packages/crypto)
* [FL Chart](https://pub.dev/packages/fl_chart)
* [Firebase Core](https://pub.dev/packages/firebase_core)
* [Firebase Analytics](https://pub.dev/packages/firebase_analytics)
* [Dropdown Button](https://pub.dev/packages/dropdown_button2)
* [Provider](https://github.com/rrousselGit/provider)
* [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts)
