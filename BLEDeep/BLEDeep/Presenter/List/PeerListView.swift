//
//  PeerListView.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import SwiftUI
import Combine

struct PeerListView: View {
    
    @StateObject var viewModel: PeersViewModel = PeersViewModel(peers: [], bleService: BLEService())
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8) {
                ForEach(viewModel.peers) { peer in
                    VStack(spacing: 2) {
                        Text("Name: \(peer.name)")
                        Text("UUID: \(peer.uuid)")
                    }
                }
            }
        }
        .navigationTitle("BLE Peers")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    PeerListView()
}
