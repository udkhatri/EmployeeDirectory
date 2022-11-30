//
//  EmployeeListViewModelTests.swift
//  EmployeeDirectoryTests
//
//  Created by Uday Khatri on 2022-11-29.
//

import XCTest
@testable import EmployeeDirectory

final class EmployeeListViewModelTests: XCTestCase {
    private var sut: EmployeeListViewModel!
    
    override func setUpWithError() throws {
        let service = MockEmployeListService(isSuccess: true)
        sut = EmployeeListViewModel(service: service)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    /// Test method to test navigation title which is localized string
    func testForNavTitle(){
        XCTAssertEqual(sut.navTitle, NSLocalizedString("employee_view_navigation_title", comment: "Employee"))
    }
    
    /// Test case for succesfull fetchEmployee method of VM
    func testForEmployeesSuccess() async {
        XCTAssertEqual(sut.isLoading, true)
        await sut.fetchEmployees()
        XCTAssertEqual(sut.isLoading, false)
        sut.getEmployeesFromCache()
        XCTAssertEqual(sut.employees.count, 11)
        XCTAssertEqual(sut.employeeList.count, 11)
    }
    
    /// Test case for catch section of fetchEmployee method of VM
    func testForEmployeesError() async {
        let service = MockEmployeListService(isSuccess: false)
        sut = EmployeeListViewModel(service: service)
        XCTAssertEqual(sut.isLoading, true)
        await sut.fetchEmployees()
        XCTAssertEqual(sut.isLoading, false)
        XCTAssertEqual(sut.isError, true)
        sut.getEmployeesFromCache()
        XCTAssertEqual(sut.employeeList.count, 0)
        XCTAssertEqual(sut.employees.count, 0)
    }
    
    /// Test case for Caching (adding data to cache and removing as well)
    func testCache() async {
        await sut.fetchEmployees() /// this method will add employee list data to the cache
        let employeeCache = EmployeeCacheManager.instance
        var employeesFromCache: [Employee] = []
        employeesFromCache = employeeCache.get(key: "CACHED_EMPLOYEES") ?? []
        XCTAssertGreaterThan(employeesFromCache.count, 0)
        sut.removeCache() /// this function will remove employee list from the cache
        employeesFromCache = employeeCache.get(key: "CACHED_EMPLOYEES") ?? []
        XCTAssertEqual(employeesFromCache.count, 0)
    }
    
    /// Test case for search functionality
    func testForFilterSearchResults() async {
        XCTAssertEqual(sut.isLoading, true)
        await sut.fetchEmployees()
        XCTAssertEqual(sut.isLoading, false)
        sut.getEmployeesFromCache()
        XCTAssertEqual(sut.employees.count, 11)
        XCTAssertEqual(sut.employeeList.count, 11)
        
        sut.searchTerm = "Justine Mason"
        sut.filterSearchResults()
        XCTAssertEqual(sut.employeeList.count, 1)
        XCTAssertEqual(sut.employeeList[0].full_name, "Justine Mason" )
        XCTAssertEqual(sut.employeeList[0].uuid, "0d8fcc12-4d0c-425c-8355-390b312b909c" )
    }
}
