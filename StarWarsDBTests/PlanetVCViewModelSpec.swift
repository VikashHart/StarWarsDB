import UIKit
import Quick
import Nimble
@testable import StarWarsDB

private class MockClient: PlanetsRetrievable {
    func getPlanets(completion: @escaping (Result<[PlanetData], NetworkError>) -> Void) {
        completion(.success([PlanetData(name: "Alderaan", rotation_period: "24", orbital_period: "364", diameter: "12500", climate: "temperate", gravity: "1 standard", terrain: "grasslands, mountains", surface_water: "40", population: "2000000000", created: "2014-12-10T11:35:48.479000Z")]))
    }

    func getNextPlanets(completion: @escaping (Result<[PlanetData], NetworkError>) -> Void) {
        completion(.success([PlanetData(name: "Alderaan", rotation_period: "24", orbital_period: "364", diameter: "12500", climate: "temperate", gravity: "1 standard", terrain: "grasslands, mountains", surface_water: "40", population: "2000000000", created: "2014-12-10T11:35:48.479000Z")]))
    }
}

class PlanetsVCViewModel: QuickSpec {

    override func spec() {
        var viewModel: PlanetVCViewModeling!
        var onDataRecieved: (() -> Void)!
        var didRecieve: Bool!

        describe("PlanetVCViewModel") {
            context("when data is received the onDataRecieved callback is called") {

                beforeEach {
                    viewModel = PlanetVCViewModel(apiClient: MockClient())

                    onDataRecieved = {
                        didRecieve = true
                    }

                    viewModel.onDataRecieved = onDataRecieved
                    viewModel.onDataRecieved?()
                }

                it("didRecieve should be true") {
                    expect(didRecieve).to(be(true))
                }
            }
        }
    }
}
