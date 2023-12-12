//
//  AtomicViewModel.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import Foundation
import AtomicSDK

class AtomicViewModel : ObservableObject {
    init() {
        setupAtomic()
    }
    
    func setupAtomic() {
        print("setting up atomic")
        AACSession.enableDebugMode(3)
        if let url = URL(string: AtomicConfiguration.apiHost) {
            AACSession.setApiBaseUrl(url)
        }
        
        AACSession.initialise(withEnvironmentId: AtomicConfiguration.environmentId,
                              apiKey: AtomicConfiguration.apiKey)
        
        AACSession.setSessionDelegate(AtomicSessionDelegate())
    }
}
