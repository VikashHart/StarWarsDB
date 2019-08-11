import Foundation

struct StarWarsPeopleModel: Codable {
    let count: String
    let next: String?
    let results: [PersonData]
}

struct PersonData: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let created: String

    enum CodingKey: String, Codable {
        case name
        case height
        case mass = "weight"
        case hair_color = "hairColor"
        case skin_color = "skinColor"
        case eye_color = "eyeColor"
        case birth_year = "birthYear"
        case gender
        case created = "dataCreatedDate"
    }
}
