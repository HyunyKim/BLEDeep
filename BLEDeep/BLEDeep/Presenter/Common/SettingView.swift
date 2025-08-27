//
//  SettingView.swift
//  BLEDeep
//
//  Created by JeongHyun Kim on 8/27/25.
//

import SwiftUI
import Combine

class SettingViewModel: ObservableObject {
    
    var menus: [SettingMenus] = SettingMenus.allCases
    
    @Published var scanTime: Int = 5
}

struct SettingView: View {
    
    @StateObject private var viewModel: SettingViewModel = SettingViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(viewModel.menus, id: \.self) { menu in
                    Text(menu.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                        .cornerRadius(8)
                }
            }
        }.navigationTitle("Setting")
    }
}

#Preview {
    SettingView()
}
