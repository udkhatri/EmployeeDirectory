//
//  EmployeeList.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct EmployeeListView: View {
    @ObservedObject var viewModel: EmployeeListViewModel
    
    fileprivate func createList() -> some View {
        return List(viewModel.employees) { employee in
            EmployeeRow(employee: employee)
                .listRowSeparator(.hidden)
        }
        .background()
        .scrollContentBackground(.hidden)
        .navigationTitle("Employee")
        .listStyle(.plain)
        .animation(.default, value: viewModel.employees)
       
    }
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Fetching Employees, please wait...")
                    .progressViewStyle(CircularProgressViewStyle(tint: .red))
            } else {
                createList()
            }
        }
        .task {
            if viewModel.employees.count == 0
            {
                await viewModel.fetchEmployees()
            }
        }
    }
}

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel())
    }
}
