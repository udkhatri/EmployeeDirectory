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
            EmployeeListView()
                .tabItem {
                    Label("Employees", systemImage: "person.3")
                }
            SettingsView()
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
