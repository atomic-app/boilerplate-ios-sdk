//
//  AppDelegate.swift
//  iOSBoilerplate
//
//  Created by Eric on 23/12/22.
//

import UIKit
import AtomicSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AACSession.enableDebugMode(1)
        if let url = URL(string: AtomicSettings.apiHost) {
            AACSession.setApiBaseUrl(url)
        }
        AACSession.initialise(withEnvironmentId: AtomicSettings.environmentId, apiKey: AtomicSettings.apiKey)
        AACSession.setSessionDelegate(AtomicSessionDelegate())
        
        // Register stream containers for push notifications.
        AACSession.registerStreamContainers(forPushNotifications: [AtomicSettings.streamContainerId]) { error in
            if let error = error as? NSError, let errorCode = AACSessionPushRegistrationError.Code(rawValue: error.code) {
                switch errorCode {
                case .domainDataError:
                    // Deal with data error.
                    if let dataError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ A data error happened when registering containers for push notifications. \(dataError)")
                    }
                case .codeNetworkError:
                    // Deal with network error.
                    if let networkError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ A network error happened when registering containers for push notifications. \(networkError)")
                    }
                @unknown default:
                    // A new type of error is added in the future.
                    if let unknownError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ An unknown error happened when registering containers for push notifications. \(unknownError)")
                    }
                }
            }
        }
        
        // Request permission for push notifications.
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if let error = error {
                print("❌ An error happened when trying to obtain notification permission on device. \(error)")
                return
            }
            if(granted) {
                print("✅ Push notification permission granted, sending device token.")
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            } else {
                print("⚠️ Push notification permission not granted. Turn it on in 'Settings' app.")
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        AACSession.registerDevice(forNotifications: deviceToken) { error in
            if let error = error as? NSError , let errorCode = AACSessionPushRegistrationError.Code(rawValue: error.code) {
                switch errorCode {
                case .domainDataError:
                    // Deal with data error.
                    if let dataError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ A data error happened when registering the device for push notifications. \(dataError)")
                    }
                case .codeNetworkError:
                    // Deal with network error.
                    if let networkError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ A network error happened when registering the device for push notifications. \(networkError)")
                    }
                @unknown default:
                    // A new type of error is added in the future.
                    if let unknownError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                        print("❌ An unknown error happened when registering the device for push notifications. \(unknownError)")
                    }
                }
            }
        }
    }

}

