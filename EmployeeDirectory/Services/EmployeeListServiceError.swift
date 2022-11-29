enum EmployeeListServiceError: Error {
    case invalidResponse(String)
    case sessionTimeout
    case keyNotFound
}
