//
//  AppData.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

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
