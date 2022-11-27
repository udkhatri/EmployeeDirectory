//
//  EmployeeRow.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-23.
//

import SwiftUI

struct EmployeeRow: View {
    var employee: Employee
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationLink( destination: EmployeeView()) {
        HStack{
            AsyncImage(url: URL(string: employee.photoUrlSmall!)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(30)
            .shadow(radius: 3, x: 2, y: 3)
            .frame(width: 60, height: 60 )
            VStack(alignment: .leading) {
                Text(employee.fullName)
                    .foregroundColor(.accentColor)
                    .font(.headline)
                Text("Team: \(employee.team)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity,maxHeight: 30 ,alignment: .leading)
            .padding(10)
            
        }
        .padding(10)
        .background {
            colorScheme == .dark ? Color(UIColor.darkGray) : Color.white
        }
        .cornerRadius(15)
        .shadow(radius: 3, x: 2, y: 3)

        }
    }
}
