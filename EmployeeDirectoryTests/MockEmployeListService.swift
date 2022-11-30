//
//  MockEmployeListService.swift
//  EmployeeDirectoryTests
//
//  Created by Uday Khatri on 2022-11-29.
//

import Foundation
@testable import EmployeeDirectory

struct MockEmployeListService: EmployeeListServiceType {
    var isSuccess: Bool = true

    func fetch<T: Decodable>(type: T.Type, from urlString: String) async throws -> T? where T : Decodable {
        return nil
    }
    
    
    func fetchEmployees() async throws -> [Employee] {
        if isSuccess,
        let employeeList = TestAssetsJson.decodableObject(type: EmployeeList.self, from: "EmployeeListData") {
            print("isSuccess:", isSuccess)
            return employeeList.employees
        } else {
            throw ApiError.invalidResponse("Unable to response, bad json")
        }
    }
   
}
