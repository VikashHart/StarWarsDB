import UIKit

extension UILabel {
    class func makeGillSansLabel(fontSize: CGFloat, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.textAlignment = alignment
        label.textColor = .black
        label.font = UIFont(fontName: .gillSansBoldItalic, size: fontSize)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        return label
    }
}
