import Foundation

final class EmployeeListViewModel: ObservableObject {
    private let service: EmployeeListServiceType
    @Published private(set) var employees: [Employee] = []
    @Published private(set) var isLoading = false
    @Published var searchTerm: String = ""
    @Published var searchResults: [Employee] = []
    
    /// Locallized strings used in Employees screen
    let navTitle: String = NSLocalizedString("employee_view_navigation_title", comment: "Employee")
    let team: String = NSLocalizedString("team", comment: "team")
    let loadingText: String = NSLocalizedString("loading_text", comment: "Fetching Employees list, please wait")
    let searchbarPlaceholder: String = NSLocalizedString("searchbar_content", comment: "Search for employee")
    
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
