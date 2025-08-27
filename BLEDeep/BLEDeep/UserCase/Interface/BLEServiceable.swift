//
//  BLEServiceable.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import Foundation
import CoreBluetooth
import Combine

protocol BLEServiceable {
    var centralManager: CBCentralManager! { get }
    var prepheralManager: CBPeripheralManager! { get }
    
    var preparalInfo: CurrentValueSubject<[PeripheralInfo], Never> { get }
}
