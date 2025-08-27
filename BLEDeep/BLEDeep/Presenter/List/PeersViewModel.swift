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
    private var cancellables: Set<AnyCancellable> = []
    
    init(peers: [PeripheralInfo] = [], bleService: BLEServiceable) {
        self.peers = peers
        self.bleService = bleService
        binding()
    }
    
    private func binding() {
        bleService.preparalInfo
            .dropFirst()
            .sink {[weak self] infos in
            self?.peers = infos
            print("연결")
        }.store(in: &cancellables)
    }
    
    func startScanning(timeOut: Int = 5, targeting: Bool = true) {
        bleService.startScanning(timeout: timeOut, targeting: targeting)
    }
}

