//
//  ImageLoader.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-23.
//
import Foundation
import SwiftUI

enum NetworkError: Error {
    case badRequest
    case unsupportedImage
    case baseUrl
}

class ImageLoader: ObservableObject {
    func fetchImage(_ url: URL?) async throws {
        guard let url = url else {
            throw NetworkError.badRequest
        }
        
        let request = URLRequest(url:url)
    }
}
