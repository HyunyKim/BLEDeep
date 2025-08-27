//
//  BLEService.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import Combine
import CoreBluetooth
import Foundation

final class BLEService: NSObject, BLEServiceable {
    var centralManager: CBCentralManager!
    var prepheralManager: CBPeripheralManager!
    var preparalInfo: CurrentValueSubject<[PeripheralInfo], Never> = CurrentValueSubject([])

    override init() {
        super.init()
        checkPermission()
        centralManager = CBCentralManager(delegate: self, queue: nil)
        prepheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
}

extension BLEService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {}
}

extension BLEService: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {}
}

private extension BLEService {
    func checkPermission() {
        let authorization = CBCentralManager.authorization

        switch authorization {
        case .allowedAlways:
            print("블루투스 권한 허용됨")
        case .denied:
            print("블루투스 권한 거부됨")
        case .restricted:
            print("블루투스 권한이 제한됨")
        case .notDetermined:
            print("블루투스 권한 미정")
        @unknown default:
            print("알 수 없는 권한 상태")
        }
    }
}
