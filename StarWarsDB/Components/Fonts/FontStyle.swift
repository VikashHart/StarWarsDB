import UIKit

enum FontName: String {
    case gillSansBoldItalic = "GillSans-BoldItalic"
}

extension UIFont {
    convenience init(fontName: FontName, size: CGFloat) {
        self.init(name: fontName.rawValue, size: size)!
    }
}
