//
//  PeripheralInfo.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import CoreBluetooth

struct PeripheralInfo: Equatable, Identifiable {
    var id: String { self.uuid.uuidString }

    let uuid: CBUUID
    let name: String
    let info: CBPeripheral
}
