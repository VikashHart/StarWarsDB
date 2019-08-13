import UIKit
import Quick
import Nimble
@testable import StarWarsDB

class PersonCellViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: PersonCellViewModeling!

        describe("PersonCellViewModel") {
            context("When the view model is initialized with expected values") {

                beforeEach {
                    viewModel = PersonCellViewModel(person: PersonData(name: "Luke Skywalker", height: "172", mass: "77", hair_color: "blond", skin_color: "fair", eye_color: "blue", birth_year: "19BBY", gender: "male", created: "2014-12-09T13:50:51.644000Z"))
                }

                it("name should return as 'Luke Skywalker'") {
                    expect(viewModel.name).to(equal("Luke Skywalker"))
                }

                it("height should return as 'Height: 5.6 ft'") {
                    expect(viewModel.height).to(equal("Height: 5.6 ft"))
                }

                it("weight shoud return as 'Weight: 169.8 lbs'") {
                    expect(viewModel.weight).to(equal("Weight: 169.8 lbs"))
                }

                it("hairColor should return as 'Hair Color: blond'") {
                    expect(viewModel.hairColor).to(equal("Hair Color: blond"))
                }

                it("skinColor should return as 'Skin Color: fair'") {
                    expect(viewModel.skinColor).to(equal("Skin Color: fair"))
                }

                it("eyeColor should return as 'Eye Color: blue'") {
                    expect(viewModel.eyeColor).to(equal("Eye Color: blue"))
                }

                it("birthYear should return as 'Birth Year: 19BBY'") {
                    expect(viewModel.birthYear).to(equal("Birth Year: 19BBY"))
                }

                it("gender should return as 'Gender: male'") {
                    expect(viewModel.gender).to(equal("Gender: male"))
                }

                it("dataCreatedDate should return as 'Data Created: Tue Dec 9, 2014 8:50 AM'") {
                    expect(viewModel.dataCreatedDate).to(equal("Data Created: Tue Dec 9, 2014 8:50 AM"))
                }

                it("hairColorUIColorOne should return as '.yellow'") {
                    expect(viewModel.hairColorUIColorOne).to(equal(.yellow))
                }

                it("hairColorUIColorTwo should return as '.clear'") {
                    expect(viewModel.hairColorUIColorTwo).to(equal(.clear))
                }

                it("eyeColorUIColorOne should return as '.blue'") {
                    expect(viewModel.eyeColorUIColorOne).to(equal(.ocean))
                }

                it("eyeColorUIColorTwo should return as '.clear'") {
                    expect(viewModel.eyeColorUIColorTwo).to(equal(.clear))
                }
            }

            context("When the view model is initialized with unexpected values") {

                beforeEach {
                    viewModel = PersonCellViewModel(person: PersonData(name: "Luke Skywalker", height: "tall", mass: "big", hair_color: "purple", skin_color: "fair", eye_color: "teal", birth_year: "19BBY", gender: "male", created: "2014-12-09T13:50:51.644000Z"))
                }

                it("height should return as 'Height: Unknown'") {
                    expect(viewModel.height).to(equal("Height: Unknown"))
                }

                it("weight should return as 'Weight: unknown'") {
                    expect(viewModel.weight).to(equal("Weight: Unknown"))
                }

                it("hairColorUIColorOne should return as '.clear'") {
                    expect(viewModel.hairColorUIColorOne).to(equal(.clear))
                }

                it("hairColorUIColorTwo should return as '.clear'") {
                    expect(viewModel.hairColorUIColorTwo).to(equal(.clear))
                }

                it("eyeColorUIColorOne should return as '.clear'") {
                    expect(viewModel.eyeColorUIColorOne).to(equal(.clear))
                }

                it("eyeColorUIColorTwo should return as '.clear'") {
                    expect(viewModel.eyeColorUIColorTwo).to(equal(.clear))
                }
            }
        }
    }
}
