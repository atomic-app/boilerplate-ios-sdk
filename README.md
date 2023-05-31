# iOS Boilerplate App

This is a boilerplate app that can be forked to get you started with the Atomic SDK for iOS.

The code is based around the [Atomic iOS SDK documentation](https://documentation.atomic.io/sdks/ios) and designed to get you up and running as quickly as possible, not necessarily as best practice. 

Therefore we do NOT recommend uploading this boilerplate app or any of its modifications to AppStore, or using it in the production environment.

## Quick Start

This boilerplate app is written as an Xcode project, whose project file is `iOSBoilerplate.xcodeproj`, located in the folder `iOSBoilerplate`. Before opening this project, make sure you have the latest Xcode installed (currently v14.3 (14E222b)). For simplified configuration, the Atomic SDK is imported using Swift Package Manager, so just open the Xcode project and choose File > Packages > Update to Latest Package Versions to get the latest SDK. In your real Xcode projects, Atomic SDK can be installed as the [Atomic iOS SDK installation documentation](https://documentation.atomic.io/sdks/ios#installation) instructs.

### SDK configuration
The app won't run out of the box, you will need to add your own values to fill the struct `AtomicSettings`, located in file `iOSBoilerplate/Atomic/AtomicSettings.swift`.

![Atomic settings](AtomicSettings.png)

To find the correct values:

    - Open the [Atomic Workbench] (https://workbench.atomic.io/), and navigate to the Configuration area.
    - Under the 'SDK' header, your environment ID is at the top of the page under 'Environment ID'.
    - Your stream container ID is in the 'Stream containers' section.
    - Your API host is in the 'API Host' section.
    - Your API key can be found (or created) in the 'API Keys' section.

You will also need to return a valid JSON Web Token (JWT) in `iOSBoilerplate/Atomic/AtomicSessionDelegate.swift` for authentication. See [SDK Authentication](https://documentation.atomic.io/sdks/auth-SDK) for more details on how to generate a JWT.

## Runtime Variables

For an example of how to set runtime variables in your code, check out the branch [feature/runtime-variables](https://github.com/atomic-app/boilerplate-ios-sdk/tree/feature/runtime-variables).

## Notifications

**Note:** Conditions to match if you want to test push notifications on simulators:
 - Xcode version is 14.0 or above.
 - The Mac computer has Apple silicon or T2 processors.
 - The Mac computer runs on macOS 13 or above.
 - The simulator runs on iOS 16 or above.
 
 For more details on push notifications in simulators, see [Xcode 14 Release Notes](https://developer.apple.com/documentation/xcode-release-notes/xcode-14-release-notes).

Check file `iOSBoilerplate/AppDelegate.swift` for how to register the stream container and device for push notifications. You also need to do some extra setup before trying this feature.

Detailed instructions for setting up push notifications can be found in our [Atomic iOS SDK push notification documentation](https://documentation.atomic.io/sdks/ios#push-notifications), but the main steps are:

- Enable the push notifications capability for the project, which has been done for this boilerplate app.
- Register an App ID in your own Apple developer account. Change the bundle identifier of this app if necessary, and make sure "Push notifications" is enabled in "Capabilities".
- Configure push notification authentication
    - For certificate authentication, create an Apple Sandbox Push Services Certificate if you run the app directly from Xcode, create an Apple Push Services Certificate if you run the app from TestFlight.
    - For token authentication, create an Apple Push Notifications service (APNs) key. 
- Upload the certificate p12 file/token p8 file to your Atomic Workbench under Configuration -> Notifications. See [Atomic Workbench notifications documentation](https://documentation.atomic.io/workbench/configuration#notifications) for more details.

**Note:** 
The iOS sandbox notification in Atomic Workbench is only available for development purposes, such as apps installed via Xcode. If you're working with TestFlight or App Store apps, you'll need to set up a regular iOS notification. 

To set up an iOS sandbox notification, you can upload either the Apple Sandbox Push Service Certificate or the Apple Push Services Certificate. However, for a regular iOS notification, you can only use the Apple Push Services Certificate.

### Troubleshooting push notifications
The following checklist can be used to verify if push notification is configured correctly.
1. Notifications are enabled for the card you are sending, which can be checked on 'Notifications' tab of the card in Atomic Workbench.
2. Check the target platforms (iOS, Android or Web) for the card you are sending in Atomic Workbench. It's on `Delivery` tab of the card or in the `Advanced` section of `Send test card` dialog.
3. `[registerStreamContainersForPushNotifications:]` has been called and no errors are returned.
4. `[registerDeviceForNotifications:]` has been called and no errors are returned.
5. The Bundle Identifier matches the `Certificate Name` in Apple Push Services Certificate or Apple Sandbox Push Service Certificate.
6. The correct type of certificate has been created. (Production for all situations, Sandbox for local deployment by Xcode)
7. The certificate has been uploaded to Atomic Workbench.
8. The correct type of Atomic Workbench's push notification configuration has been created. ('iOS' for AdHoc, TestFlight or AppStore apps, 'iOS Sandbox' for Xcode installation)
9. The Bundle Identifier matches the ID in Atomic Workbench's push notification configuration.
10. The entitlement file has been set up in the project. (See `iOSBoilerplate.entitlements` for more details)

