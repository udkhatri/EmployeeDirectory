import Foundation

struct TestAssetsJson {
    static var bundelForTestCase: Bundle? {
        return Bundle(for: EmployeeListViewModelTests.self)
    }
    
    static func jsonData(with fileName: String) -> Data? {
        
        if let bundle = bundelForTestCase,
           let path = bundle.path(forResource: "EmployeeListData", ofType: "json") {
            let fileUrl = URL(fileURLWithPath: path)
           
            return try? Data(contentsOf: fileUrl)
        }
        return nil
    }
    
    static func decodableObject<T: Decodable>(type: T.Type, from jsonFileName: String) -> T? {
        guard let data = jsonData(with: jsonFileName) else {
            return nil
        }
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(T.self, from: data)
    }
}
