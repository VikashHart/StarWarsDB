import UIKit

extension UIColor {
    convenience init? (hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let filteredStr = hexString.filter{"aAbBcCdDeEfF0123456789".contains($0)}

        guard hexString.count == filteredStr.count, hexString.count == 6 else {
            return nil
        }

        let positionR = hexString.index(hexString.startIndex, offsetBy: 2)
        let positionG = hexString.index(hexString.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hexString[..<positionR]),
            let g = Double("0x" + hexString[positionR..<positionG]),
            let b = Double("0x" + hexString[positionG...]) else { return nil }

        self.init(red:   CGFloat(r / 255),
                  green: CGFloat(g / 255),
                  blue:  CGFloat(b / 255),
                  alpha: 1)
    }
}

extension UIColor {
    // Black
    static let lightBlack = UIColor(hexString: "434343")!
    // Gray
    static let stone     = UIColor(hexString: "868f96")!
    static let cloudy    = UIColor(hexString: "d7d2cc")!
    static let fog       = UIColor(hexString: "ebedee")!
    //Brown
    static let auburn = UIColor(hexString: "5F2624")!
    static let hazel = UIColor(hexString: "A56948")!
    static let darkBrown = UIColor(hexString: "391212")!
    // Purple
    static let amethyst  = UIColor(hexString: "9d50bb")!
    static let violet    = UIColor(hexString: "3B0066")!
    // Blue
    static let bluejay   = UIColor(hexString: "00d2ff")!
    static let blueberry = UIColor(hexString: "3a7bd5")!
    static let ocean     = UIColor(hexString: "219DFF")!
    static let blueGray = UIColor(hexString: "ABC2D3")!
    // Green
    static let clover    = UIColor(hexString: "0f9b0f")!
    static let limerick  = UIColor(hexString: "a2c115")!
    // Yellow
    static let starWars = UIColor(hexString: "F0E123")!
    static let gold      = UIColor(hexString: "D4AF37")!
    static let lemon     = UIColor(hexString: "f9f047")!
    static let marigold  = UIColor(hexString: "F6AE2D")!
    static let mustard  = UIColor(hexString: "F5DE45")!
    // Orange
    static let tangerine = UIColor(hexString: "fe8c00")!
    // Red
    static let tomato    = UIColor(hexString: "f83600")!
    static let bloodRed  = UIColor(hexString: "#870000")!
    // Pink
    static let pink      = UIColor(hexString: "ec77ab")!
}

extension CGColor {
    static let blacks  = [UIColor.black.cgColor, UIColor.lightBlack.cgColor]
    static let reds    = [UIColor.bloodRed.cgColor, UIColor.tomato.cgColor]
    static let blues   = [UIColor.blueberry.cgColor, UIColor.bluejay.cgColor]
    static let greens  = [UIColor.clover.cgColor, UIColor.limerick.cgColor]
    static let purples = [UIColor.violet.cgColor, UIColor.amethyst.cgColor]
}
