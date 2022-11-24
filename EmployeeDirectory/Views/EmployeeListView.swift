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
        return List(viewModel.employeeList) { employee in
            EmployeeRow(employee: employee)
                .listRowSeparator(.hidden)
        }
        .padding(0.0)
        .scrollContentBackground(.hidden)
        .navigationTitle(viewModel.navTitle)
        .listStyle(.plain)
        .animation(.easeInOut, value: viewModel.employees)
        .searchable(text: $viewModel.searchTerm,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: viewModel.searchbarPlaceholder)
        .onChange(of: viewModel.searchTerm, perform: { newValue in
            viewModel.filterSearchResults()
        })
    }
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView(viewModel.loadingText)
                    .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
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
