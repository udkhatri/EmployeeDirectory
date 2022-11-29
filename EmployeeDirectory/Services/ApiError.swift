enum ApiError: Error {
    case na
    case invalidRequest(String)
    case invalidResponse(String)
    case sessionTimeout
    case unauthorized
    case noInternet(String)
    
}
