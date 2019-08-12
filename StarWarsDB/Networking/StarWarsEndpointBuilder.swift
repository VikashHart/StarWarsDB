import Foundation

struct StarWarsEndpointBuilder {
    enum StarWarsEndpoint {
        case people
        case planets
    }

    static private let apiBase = "https://swapi.co/api"

    static func endpoint(_ type: StarWarsEndpoint) -> URL {
        let path: String
        switch type {
        case .people: path = "/people"
        case .planets: path = "/planets"
        }
        return URL(string: apiBase + path)!
    }

}
