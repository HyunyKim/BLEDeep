//
//  PeersViewModel.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import SwiftUI
import Combine
import CoreBluetooth

class PeersViewModel: ObservableObject {
    @Published var peers: [PeripheralInfo] = []
    
    private let bleService: BLEServiceable
    
    init(peers: [PeripheralInfo] = [], bleService: BLEServiceable) {
        self.peers = peers
        self.bleService = bleService
    }
}
