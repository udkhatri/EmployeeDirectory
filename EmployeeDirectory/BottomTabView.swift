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
            EmployeeList()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            
            Settings()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
    }
}
