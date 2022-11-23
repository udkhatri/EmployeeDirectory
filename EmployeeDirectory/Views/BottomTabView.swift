//
//  TabView.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        TabView {
            EmployeeListView(viewModel: EmployeeListViewModel())
                .tabItem {
                    Label("Employees", systemImage: "person.3")
                }
            SettingsView(viewModel: SettingViewModel())
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
        .onAppear() {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            appearance.backgroundColor = UIColor(Color.gray.opacity(0.0))
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
