//
//  AppView.swift
//  MutipurposeApp
//
//  Created by Sandeep on 27/09/24.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            Tab("Crypto", systemImage: "bitcoinsign") {
                CryptoHome()
            }
            Tab("Travel", systemImage: "map.circle"){
                TravelHome()
            }
            Tab("Users", systemImage: "person"){
                UserlistView()
            }
        }
    }
}

#Preview {
    AppView()
}
