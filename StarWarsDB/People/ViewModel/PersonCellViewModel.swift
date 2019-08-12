import UIKit

protocol PersonCellViewModeling {
    var name: String { get }
    var height: String { get }
    var weight: String { get }
    var hairColor: String { get }
    var hairColorUIColorOne: UIColor { get }
    var hairColorUIColorTwo: UIColor { get }
    var skinColor: String { get }
    var eyeColor: String { get }
    var eyeColorUIColorOne: UIColor { get }
    var eyeColorUIColorTwo: UIColor { get }
    var birthYear: String { get }
    var gender: String { get }
    var dataCreatedDate: String { get }
}

class PersonCellViewModel: PersonCellViewModeling {
    var name: String

    var height: String = "Height: Unknown"

    var weight: String = "Weight: Unknown"

    var hairColor: String

    var hairColorUIColorOne: UIColor = .clear

    var hairColorUIColorTwo: UIColor = .clear

    var skinColor: String

    var eyeColor: String

    var eyeColorUIColorOne: UIColor = .clear

    var eyeColorUIColorTwo: UIColor = .clear

    var birthYear: String

    var gender: String

    var dataCreatedDate: String = "Data Entered: Date Unkown"

    init(person: PersonData) {
        self.name = person.name
        self.hairColor = "Hair Color: \(person.hair_color)"
        self.skinColor = "Skin Color: \(person.skin_color)"
        self.eyeColor = "Eye Color: \(person.eye_color)"
        self.birthYear = "Birth Year: \(person.birth_year)"
        self.gender = "Gender: \(person.gender)"

        if let heightInFtAsDouble = Double(person.height) {
            self.height = "Height: \(((heightInFtAsDouble) / 30.48).rounded(to: 1)) ft"
        }

        if let weightInLbsAsDouble = Double(person.mass) {
            self.weight = "Weight: \(((weightInLbsAsDouble) * 2.205).rounded(to: 1)) lbs"
        }

        let hairColors = (person.hair_color).components(separatedBy: ",")
        if hairColors.count == 1 {
            self.hairColorUIColorOne = UIColor.stringToColor(colorString: hairColors[0])
            self.hairColorUIColorTwo = UIColor.clear
        } else if hairColors.count == 2 {
            self.hairColorUIColorOne = UIColor.stringToColor(colorString: hairColors[0])
            self.hairColorUIColorTwo = UIColor.stringToColor(colorString: hairColors[1])
        }

        let eyeColors = (person.eye_color).components(separatedBy: ",")
        if eyeColors.count == 1 {
            self.eyeColorUIColorOne = UIColor.stringToColor(colorString: eyeColors[0])
            self.eyeColorUIColorTwo = UIColor.clear
        } else if hairColors.count == 2 {
            self.eyeColorUIColorOne = UIColor.stringToColor(colorString: eyeColors[0])
            self.eyeColorUIColorTwo = UIColor.stringToColor(colorString: eyeColors[1])
        }

        self.dataCreatedDate = "Data Created: \(Date.formatDateString(dateString: person.created))"
    }
}
