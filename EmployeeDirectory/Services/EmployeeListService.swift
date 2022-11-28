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
            return nil
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            return try decoder.decode(type, from: data)
        } catch {
            print("got error",error)
            return nil
        }
    }
    
    func fetchEmployees() async throws -> [Employee] {
        return try await fetch(type: EmployeeList.self, from: Paths.EmployeeListPath)?
            .employees ?? []
    }
    
    
}
