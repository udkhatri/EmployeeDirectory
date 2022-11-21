//
//  EmployeeDirectoryApp.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

@main
struct EmployeeDirectoryApp: App {
    @AppStorage("is_user_onboareded") var isUserOnboarded: Bool = false
    var body: some Scene {
        WindowGroup {
            if isUserOnboarded{
                BottomTabView()
            }
            else{
                OnBoarding()
            }
        }
    }
}
