import SwiftUI

public extension Color {
    init?(rgb: Int) {
        let iBlue = rgb & 0xFF
        let iGreen =  (rgb >> 8) & 0xFF
        let iRed =  (rgb >> 16) & 0xFF
        self.init(red: Double(iRed)/255, green: Double(iGreen)/255,
                  blue: Double(iBlue)/255)
    }
}
