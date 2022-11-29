import Foundation

final class EmployeeListViewModel: ObservableObject {
    private let service: EmployeeListServiceType 
    @Published private(set) var employees: [Employee] = []
    @Published private(set) var isLoading = true
    @Published var searchTerm: String = ""
    @Published var searchResults: [Employee] = []
    
    /// code related to employee caching initialization
    let employeeCache = EmployeeCacheManager.instance
    let cachedEmployeKey = "CACHED_EMPLOYEES"
    
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
    /// getting data from cache and storing it to employee list
    func getEmployeesFromCache(){
        employees = employeeCache.get(key: cachedEmployeKey) ?? []
        print("employees from cached list", employees)
    }
    
    @MainActor
    /// Try to fetch data from service
    func fetchEmployees() async {
        do {
            isLoading = true
            employeeCache.add(employees: try await service.fetchEmployees(), key: cachedEmployeKey) // adding data to cache
            getEmployeesFromCache()
            isLoading = false
        }
        catch {
            print("Error happend : \(error)")
        }
    }
}
