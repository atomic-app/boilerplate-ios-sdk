//
//  ContentView.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import SwiftUI
import AtomicSwiftUISDK
import AtomicSDK

struct ContentView: View {
    
    @StateObject private var viewModel = AtomicViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    ZStack {
                        StreamContainer(isInNavigationStack: true, containerId: AtomicConfiguration.streamContainerId)
                            .navigationTitle("Atomic Stream")
                    }
                } label: {
                    Text("Messages")
                }
            }
            .padding()
            .navigationTitle("Atomic Boilerplate")
            .navigationBarTitleDisplayMode(.large)
        }
        .sheet(isPresented: $viewModel.showModal) {
            ModalView()
        }
    }
    
}

#Preview {
    ContentView()
}
