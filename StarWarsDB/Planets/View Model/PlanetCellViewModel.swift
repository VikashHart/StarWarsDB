import Foundation

protocol PlanetCellViewModeling {
    var name: String { get }
    var rotationPeriod: String { get }
    var orbitalPeriod: String { get }
    var diameter: String { get }
    var climate: String { get }
    var gravity: String { get }
    var terrain: String { get }
    var surfaceWater: String { get }
    var population: String { get }
    var dataCreatedDate: String { get }
}

class PlanetCellViewModel: PlanetCellViewModeling {
    var name: String

    var rotationPeriod: String

    var orbitalPeriod: String

    var diameter: String = "Diameter: Unknown"

    var climate: String

    var gravity: String

    var terrain: String

    var surfaceWater: String

    var population: String

    var dataCreatedDate: String = "Date Created: Unknown"

    init(planet: PlanetData) {
        self.name = planet.name
        self.rotationPeriod = "Rotation Period: \(planet.rotation_period) hours"
        self.orbitalPeriod = "Orbital Period: \(planet.orbital_period) days"
        self.climate = "Climate: \(planet.climate)"
        self.gravity = "Gravity: \(planet.gravity)"
        self.terrain = "Terrain: \(planet.terrain)"
        self.surfaceWater = "Surface Water \(planet.surface_water)%"
        self.population = "Population \(planet.population)"

        if let diameterAsDouble = Double(planet.diameter) {
            diameter = "Diameter: \(((diameterAsDouble) / 1.609).rounded(to: 1)) miles"
        }

        self.dataCreatedDate = "Date Created: \(Date.formatDateString(dateString: planet.created))"
    }
}
