import UIKit

extension UIColor {
    private static let stringColorDict: [String:UIColor] = [
        "blue": .ocean,
        "green": .clover,
        "brown": .brown,
        "hazel": .hazel,
        "yellow": .yellow,
        "red": .red,
        "blue-gray": .blueGray,
        "black": .black,
        "orange": .tangerine,
        "pink": .pink,
        "unknown": .clear,
        "dark": .darkBrown,
        "blond": .yellow,
        "blonde": .yellow,
        "auburn": .auburn,
        "none": .clear,
        "n/a": .clear,
        "grey": .stone,
        "white": .fog,
    ]

    static func stringToColor(colorString: String) -> UIColor {

        return UIColor.stringColorDict[colorString.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)] ?? UIColor.clear
    }
}
