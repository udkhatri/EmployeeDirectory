//
//  EmployeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

final class EmployeListViewModel: ObservableObject {
    // MARK: - Observable properties
    @ObservedObject var store: SandwichStore
}

