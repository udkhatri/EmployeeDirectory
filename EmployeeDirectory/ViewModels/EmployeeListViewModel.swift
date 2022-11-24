import Foundation

final class EmployeeListViewModel: ObservableObject {
    private let service: EmployeeListServiceType
    @Published private(set) var employees: [Employee] = []
    @Published private(set) var isLoading = false
    @Published var searchTerm: String = ""
    @Published var searchResults: [Employee] = []
    
    /// To display data, either search result or intiaal data
    var employeeList: [Employee] {
        return searchTerm.isEmpty ? employees : searchResults
    }
    
    init(service: EmployeeListServiceType = EmployeeListService()) {
        self.service = service
    }
    
    func filterSearchResults() {
        searchResults = employees.filter({ $0.fullName.localizedCaseInsensitiveContains(searchTerm)})
    }
    @MainActor
    /// Try to fetch data from service
    func fetchEmployees() async {
        do {
            isLoading = true
            employees = try await service.fetchEmployees()
            isLoading = false
        }
        catch {
            print("Error happend : \(error)")
        }
    }
}
