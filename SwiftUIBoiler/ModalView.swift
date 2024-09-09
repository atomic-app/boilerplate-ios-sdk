//
//  ModalView.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 10/09/2024.
//

import SwiftUI
import AtomicSwiftUISDK

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Dismiss") {
            dismiss()
        }
        
        SingleCardContainer(containerId: AtomicConfiguration.modalContainer)
    }
}
