import Foundation

struct Language: Decodable, Identifiable {
    var id: String { code }
    let code: String
    let label: String
}

struct LanguageList: Decodable {
    let codeLanguages: [Language]
}

extension Language: Equatable {
}
