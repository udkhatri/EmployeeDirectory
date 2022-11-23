enum SpamWordsServiceError: Error {
    case invalidResponse(String)
    case sessionTimeout
}
