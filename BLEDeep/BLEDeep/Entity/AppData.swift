//
//  AppData.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import CoreBluetooth

public enum SettingMenus: Equatable, Hashable, CaseIterable {
    case scanTime
    case backgroundMode
    
    var title: String {
        switch self {
        case .scanTime: "스캔 시간"
        case .backgroundMode: "백그라운드 모드"
        }
    }
}


public enum BLEConstants {
    static let serviceUUID = CBUUID(string: "22223333-3333-4444-5555-123456789012")
    static let userData = CBUUID(string: "00009999-0000-1000-8000-00805F9B34FB")
//    static let heartUUID = CBUUID(string: "180d4383-1332-47eb-8c38-7999f2746d3b")
    

}
