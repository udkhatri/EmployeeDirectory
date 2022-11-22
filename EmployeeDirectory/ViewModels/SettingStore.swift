//
//  SettingStore.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import Foundation

final class SettingStore : ObservableObject {
    @Published var appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    @Published var  appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    @Published var appIdentifier = Bundle.main.bundleIdentifier ?? "Bundle id not found"
}
