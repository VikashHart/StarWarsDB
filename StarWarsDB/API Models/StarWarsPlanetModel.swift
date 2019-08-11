import Foundation

struct StarWarsPlanetModel: Codable {
    let count: String
    let next: String?
    let results: [PlanetData]
}

struct PlanetData: Codable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let created: String

    enum CodingKey: String, Codable {
        case name
        case rotation_period = "rotationPeriod"
        case orbital_period = "orbitalPeriod"
        case diameter
        case climate
        case gravity
        case terrain
        case surface_water = "surfaceWater"
        case population
        case created = "dataCreatedDate"
    }
}
