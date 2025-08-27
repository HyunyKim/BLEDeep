//
//  ContentView.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                PeerListView()
            }.tabItem {
                Image(systemName: "person.2")
                Text("Peers")
            }

            NavigationView {
                SettingView()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("setting")
            }
        }
    }
}

#Preview { ContentView() }
