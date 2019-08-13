import UIKit
import Quick
import Nimble
@testable import StarWarsDB

private class MockClient: PeopleRetrievable {
    func getPeople(completion: @escaping (Result<[PersonData], NetworkError>) -> Void) {
        completion(.success([PersonData(name: "Luke Skywalker", height: "172", mass: "77", hair_color: "blond", skin_color: "fair", eye_color: "blue", birth_year: "19BBY", gender: "male", created: "2014-12-09T13:50:51.644000Z")]))
    }

    func getNextPeople(completion: @escaping (Result<[PersonData], NetworkError>) -> Void) {
         completion(.success([PersonData(name: "Obi Wan", height: "192", mass: "57", hair_color: "blond", skin_color: "fair", eye_color: "blue", birth_year: "19BBY", gender: "male", created: "2014-12-09T13:50:51.644000Z")]))
    }
}

class PersonVCViewModel: QuickSpec {

    override func spec() {
        var viewModel: PeopleVCViewModeling!
        var onDataRecieved: (() -> Void)!
        var didRecieve: Bool!

        describe("PersonVCViewModel") {
            context("when data is received the onDataRecieved callback is called") {

                beforeEach {
                    viewModel = PeopleVCViewModel(apiClient: MockClient())

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
