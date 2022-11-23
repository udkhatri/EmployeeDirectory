import Foundation

final class EmployeeListViewModel: ObservableObject {
    private let service: EmployeeListServiceType
    @Published private(set) var employees: [Employee] = []
    @Published private(set) var isLoading = false
    
    init(service: EmployeeListServiceType = EmployeeListService()) {
        self.service = service
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
