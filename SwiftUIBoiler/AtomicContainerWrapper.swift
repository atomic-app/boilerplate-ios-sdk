//
//  AtomicContainerWrapper.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import Foundation
import SwiftUI
import AtomicSDK

struct AtomicContainerWrapper: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIViewController

    // Create and configure the UIKit view controller
    func makeUIViewController(context: Context) -> UIViewController {
        let config = AACConfiguration()
        config.presentationStyle = .withContextualButton
        config.launchBackgroundColor = .white
        config.launchButtonColor = .blue
        config.launchTextColor = .white

        return AACStreamContainerViewController(identifier: AtomicConfiguration.streamContainerId, configuration: config)
    }

    // Update the view controller when needed
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update your view controller here
    }
}
