//
//  EmployeeListModel.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-23.
//
import Foundation

// JSON format
//"employees": [
//  {
//      "uuid": "0d8fcc12-4d0c-425c-8355-390b312b909c",
//      "full_name": "Justine Mason",
//      "phone_number": "5553280123",
//      "email_address": "jmason.demo@squareup.com",
//      "biography": "Engineer on the Point of Sale team.",
//      "photo_url_small": "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
//      "photo_url_large": "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",
//      "team": "Point of Sale",
//      "employee_type": "FULL_TIME"
//  },
//  ...
//]

struct EmployeeList: Codable {
    let employees: [Employee]
}

struct Employee: Identifiable, Codable {
    var id: String { uuid }
    let uuid: String
    let fullName: String
    let phoneNumber: String?
    let emailAddress: String
    let biography: String?
    let photoUrlSmall: String?
    let photoUrlLarge: String?
    let team: String
    let employeeType: String
//    let employeeType: EmployeeType  /// <-On adding this line it is throwing this perticular error

    enum EmployeeType: String {
        case fullTime = "FULL_TIME"
        case partTime = "PART_TIME"
        case contractor = "CONTRACTOR"
        
        var employeeTeam: String {
            switch self {
            case .fullTime:
                return "Full Time"
            case .partTime:
                return "Part Time"
            case .contractor:
                return "Contractor"
            }
        }
    }
    
}

extension Employee: Equatable {
}
