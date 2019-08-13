import UIKit
import Quick
import Nimble
@testable import StarWarsDB

class PlanetCellViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: PlanetCellViewModeling!
        
        describe("PlanetCellViewModel") {
            context("When the view model is initialized with expected values") {

                beforeEach {
                    viewModel = PlanetCellViewModel(planet: PlanetData(name: "Alderaan", rotation_period: "24", orbital_period: "364", diameter: "12500", climate: "temperate", gravity: "1 standard", terrain: "grasslands, mountains", surface_water: "40", population: "2000000000", created: "2014-12-10T11:35:48.479000Z"))
                }

                it("diameter should return as 'Diameter: 7768.8 miles'") {
                    expect(viewModel.diameter).to(equal("Diameter: 7768.8 miles"))
                }
            }

            context("When the view model is initialized with unexpected values") {

                beforeEach {
                    viewModel = PlanetCellViewModel(planet: PlanetData(name: "Alderaan", rotation_period: "24", orbital_period: "364", diameter: "huge", climate: "temperate", gravity: "1 standard", terrain: "grasslands, mountains", surface_water: "40", population: "2000000000", created: "2014-12-10T11:35:48.479000Z"))
                }

                it("diameter should return as 'Diameter: Unknown'") {
                    expect(viewModel.diameter).to(equal("Diameter: Unknown"))
                }
            }
        }
    }
}
