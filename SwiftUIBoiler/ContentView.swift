//
//  ContentView.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = AtomicViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            AtomicContainerWrapper()
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
