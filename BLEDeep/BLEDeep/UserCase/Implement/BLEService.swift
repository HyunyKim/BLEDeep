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
        startAdvertising()
    }
}

extension BLEService {
    func startScanning(timeout: Int, targeting: Bool) {
        print("📡 스캔시작 - ")
        centralManager.scanForPeripherals(withServices: targeting ? [BLEConstants.serviceUUID] : nil, options: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(timeout)) {
            self.stopScanning()
        }
    }

    func stopScanning() {
        print("📡 스캔 중지 - ")
        centralManager.stopScan()
    }

    func startAdvertising() {
        let userData = Data(BLEConstants.userData.uuidString.utf8)
        let advertisementData: [String: Any] = [
            CBAdvertisementDataServiceUUIDsKey: [BLEConstants.serviceUUID],
            CBAdvertisementDataLocalNameKey: "KKB",
            CBAdvertisementDataManufacturerDataKey: userData
        ]
        prepheralManager.startAdvertising(advertisementData)
        print("광고시작🏴‍☠️")
    }

    func stopAdvertising() {
        prepheralManager.stopAdvertising()
    }
}

extension BLEService: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            print("중앙 관리자 상태: 알 수 없음")
        case .resetting:
            print("중앙 관리자 상태: 리셋 중")
        case .unsupported:
            print("중앙 관리자 상태: 지원되지 않음")
        case .unauthorized:
            print("중앙 관리자 상태: 권한 없음")
        case .poweredOff:
            print("중앙 관리자 상태: 블루투스 꺼짐")
        case .poweredOn:
            print("중앙 관리자 상태: 블루투스 켜짐")
        @unknown default:
            print("중앙 관리자 상태: 알 수 없는 오류")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        let uuid = CBUUID(nsuuid: peripheral.identifier)
        let name = peripheral.name ?? "Unknown"
        let info = peripheral
        let newPeripheral = PeripheralInfo(uuid: uuid, name: name, info: info)
        var list = preparalInfo.value
        if list.contains(where: { $0.uuid == uuid }) {
            print("중복된 주변기기 발견: \(name), UUID: \(uuid). 목록에 추가하지 않음.")
            return
        }
        list.append(newPeripheral)
        preparalInfo.send(list)
        print("주변기기 발견: \(name), UUID: \(uuid)")
    }
}

extension BLEService: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .unknown:
            print("주변기기 관리자 상태: 알 수 없음")
        case .resetting:
            print("주변기기 관리자 상태: 리셋 중")
        case .unsupported:
            print("주변기기 관리자 상태: 지원되지 않음")
        case .unauthorized:
            print("주변기기 관리자 상태: 권한 없음")
        case .poweredOff:
            print("주변기기 관리자 상태: 블루투스 꺼짐")
        case .poweredOn:
            print("주변기기 관리자 상태: 블루투스 켜짐")
        @unknown default:
            print("주변기기 관리자 상태: 알 수 없는 오류")
        }
    }
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
