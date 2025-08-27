//
//  PeerListView.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import Combine
import CoreBluetooth
import SwiftUI

struct PeerListView: View {
    @StateObject var viewModel: PeersViewModel = .init(peers: [], bleService: BLEService())

    var body: some View {
        
        VStack(alignment: .center, content: {
            infoView
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.peers) { peer in
                        VStack(alignment: .leading, spacing: 2) {
                            Text("📡Name: \(peer.name)")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.bottom, 4)
                            Text("UUID: \(peer.uuid)")
                                .font(.system(size: 14))
                                .padding(.leading, 10)
                        }
                    }
                }.padding(.horizontal, 14)
            }
        })
       
        .navigationTitle("BLE Peers")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                viewModel.startScanning(targeting: true)
            } label: {
                Image(systemName: "magnifyingglass")
            }
        }
    }
    
    private var infoView: some View {
        return HStack(alignment: .center) {
            Text("dsdfsd")
        }
    }
}

#Preview {
    let list = [
        PeripheralInfo(uuid: CBUUID(string: "22223333-3333-4444-5555-123456789011"), name: "Test1", info: nil),
        PeripheralInfo(uuid: CBUUID(string: "22223333-3333-4444-5555-123456789012"), name: "Test2", info: nil),
        PeripheralInfo(uuid: CBUUID(string: "22223333-3333-4444-5555-123456789013"), name: "Test3", info: nil),
    ]
    PeerListView(viewModel: .init(peers: list, bleService: BLEService()))
}
