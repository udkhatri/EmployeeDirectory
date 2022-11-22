//
//  Settings.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var viewModel: SettingViewModel
    
    let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    let appIdentifier = Bundle.main.bundleIdentifier ?? "Bundle id not found"
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    Section(header: Text(viewModel.bundleInfo)){
                        HStack{
                            Text(viewModel.name)
                            Text(viewModel.appName)
                                .foregroundColor(.gray)
                        }
                        HStack{
                            Text(viewModel.version)
                            Text(viewModel.appVersion)
                                .foregroundColor(.gray)
                        }
                        HStack{
                            Text(viewModel.id)
                            Text(viewModel.bundleId)
                                .foregroundColor(.gray)
                        }
                    }
                    HStack{
                        Text(viewModel.devBy)
                            .foregroundColor(.gray)
                        Text(viewModel.devName)
                    }
                    
                }
               
            }.navigationTitle(viewModel.navTitle)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: SettingViewModel())
    }
}
