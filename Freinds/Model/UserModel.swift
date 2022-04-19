
import Foundation

// MARK: - Welcome
struct User: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable,Identifiable {
    let id: UUID = UUID()

    let name: Name
    let email: String
    let location: Location
    let phone: String
    let picture: Picture
    enum CodingKeys: String, CodingKey {
        case name, location, picture
        case email, phone
        
    }
}

// MARK: - Location
struct Location: Codable {
    let city, state: String
    
    enum CodingKeys: String, CodingKey {
        case city, state
        
    }
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
    enum CodingKeys: String, CodingKey {
        case title, first, last
        
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
    enum CodingKeys: String, CodingKey {
        case large, medium, thumbnail
        
    }
}
