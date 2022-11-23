import Foundation

/// SpamWordsServiceType protocol
protocol SpamWordsServiceType {
    func fetch<T: Decodable>(type: T.Type, from urlString: String) async throws -> T?
    func fetchLanguages() async throws -> [Language]
}

/// Spam Words Service
struct SpamWordsService: SpamWordsServiceType {
    struct Paths {
        static let languageListPath = "https://www.spam-words.com/api/languages"
    }
    /// JSON decoder
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetch<T: Decodable>(type: T.Type, from urlString: String) async -> T? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession
                .shared
                .data(from: url)
            
            return try decoder.decode(type, from: data)
        } catch {
            return nil
        }
    }
    
    /// Return a list of languages
    /// - Returns: [Language]
    func fetchLanguages() async -> [Language] {
        return await fetch(type: LanguageList.self, from: Paths.languageListPath)?
            .codeLanguages ?? []
    }
}

