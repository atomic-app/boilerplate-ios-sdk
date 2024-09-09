//
//  AtomicViewModel.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import Foundation
import AtomicSDK

class AtomicViewModel : ObservableObject {
    
    @Published var showModal = false
    
    init() {
        setupAtomic()
        
        AACSession.observeCardCountForStreamContainer(withIdentifier: AtomicConfiguration.modalContainer, interval: 5) { count in
            if let count = count {
                Task {
                    await self.updateModal(show: Int(truncating: count) > 0)
                }
            }
        }
    }
    
    func updateModal(show: Bool) async {
        await MainActor.run() {
            self.showModal = show
        }
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
