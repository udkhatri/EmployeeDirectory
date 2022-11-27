//
//  SwiftUIView.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-27.
//

import SwiftUI

enum Direction: String, Decodable {
    case right = "right_direction"
    case left = "left_direction"
}


extension Direction {
    var displayDirection: String {
        switch self {
        case .right:
            return "Go Right"
        case .left:
            return "Go Left"
        }
    }
}

let direction = Direction.left
let displayString = direction.displayDirection
