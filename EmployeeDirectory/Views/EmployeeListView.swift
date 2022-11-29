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
        .overlay(Group {
            if !viewModel.isLoading && viewModel.employeeList.isEmpty {
                VStack{
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 3)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .overlay(alignment: .center, content: {
                            Text("Ups! Looks like the employee list is empty.")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding()
                        })
                        .padding(40)
                    Spacer()
                }
            }
        })
        .padding(0.0)
        .scrollIndicators(.hidden)
        .scrollContentBackground(.hidden)
        .navigationTitle(viewModel.navTitle)
        .listStyle(.plain)
        .animation(.linear, value: viewModel.employeeList)
        .searchable(text: $viewModel.searchTerm,
                    placement: .navigationBarDrawer(displayMode: .automatic),
                    prompt: viewModel.searchbarPlaceholder)
        .onChange(of: viewModel.searchTerm, perform: { newValue in
            viewModel.filterSearchResults()
        })
        .refreshable {
            viewModel.getEmployeesFromCache()
        }
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
        .alert("Error",
               isPresented: $viewModel.isError,
               presenting: viewModel.state){
            detail in Button("Retry"){
                Task{
                    await viewModel.fetchEmployees()
                }
            }
            Button("Cancel"){
                
            }
        } message: { detail in
            if case let .failed(error) = detail {
                Text(error.localizedDescription)
            }
        }
        
    }
}

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(viewModel: EmployeeListViewModel())
    }
}
