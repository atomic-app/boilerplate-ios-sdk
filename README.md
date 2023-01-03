# iOS Boilerplate App

This is a boiler-plate app that can be forked to get you started with the Atomic SDK for iOS.

The code is based around the [documentation](https://documentation.atomic.io/sdks/ios) and designed to get you up and running as quickly as possible, not necessarily as best practice.

## Quick Start

Before installation, make sure you have the latest Xcode installed (currently v14.2 (14C18)). 
[Add installation here].

The app won't run out of the box, you will need to add your own values to fill the struct `AtomicSettings`.

![Atomic settings](AtomicSettings.png)

Instructions are as follows

    - Open the [Atomic Workbench] (https://workbench.atomic.io/), and navigate to the Configuration area.
    - Under the 'SDK' header, your environment ID is at the top of the page under 'Environment ID'.
    - Your stream container ID is in the 'Stream containers' section.
    - Your API host is in the 'API Host' section.
    - Your API key is in the 'API Keys' section.

You will also need to return a valid JSON Web Token (JWT) in `AtomicSessionDelegate` for authentication. See [SDK Authentication](https://documentation.atomic.io/sdks/auth-SDK) for more details on how to generate a JWT.

## Runtime Variables

For an example of how to set runtime variables in your code, checkout the branch [feature/runtime-variables](placeholder.com).

## Notifications

For an example of how to set push notifications in your code, checkout the branch [feature/push-notifications](placeholder.com).
More detailed instructions for setting up push notifications can be found in our [Atomic documentation](https://documentation.atomic.io/sdks/ios#push-notifications), but the main steps are:

    - Modify the bundle-id to be unique.
    - Set the signing configuration to use your own Apple developer account.
    - Create an Apple Push Notification certificate for the app.
    - Export the certificate and add it to your Atomic Workbench under Notifications.
