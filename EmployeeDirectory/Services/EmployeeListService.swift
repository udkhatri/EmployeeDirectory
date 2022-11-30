import Foundation

/// EmployeeListServiceType protocol
protocol EmployeeListServiceType {
    func fetch<T: Decodable>(type: T.Type, from urlString: String) async throws -> T?
    func fetchEmployees() async throws -> [Employee]
}

struct EmployeeListService: EmployeeListServiceType {
    
    struct Paths {
        static let EmployeeListPath = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    }
    /// JSON decoder
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetch<T: Decodable>(type: T.Type, from urlString: String) async throws -> T? {
        guard let url = URL(string: urlString) else {
            throw ApiError.invalidRequest("Unexpected server response")
        }
        let (data, response) = try await URLSession
            .shared
            .data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw ApiError.invalidResponse("Unexpected server response")
        }
        
        if statusCode == 403 {
            throw ApiError.noInternet("Looks like your internet is turned off.")
        }
        
        if statusCode > 299 {
            throw ApiError.invalidResponse("Server error code \(statusCode)")
        }
        return try decoder.decode(type, from: data)
    }
    
    func fetchEmployees() async throws -> [Employee] {
            return try await fetch(type: EmployeeList.self, from: Paths.EmployeeListPath)?
                .employees ?? []
    }
}
