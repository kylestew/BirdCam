import Foundation

extension Double {
    func map(from: ClosedRange<Double>, to: ClosedRange<Double>) -> Double {
        let result = ((self - from.lowerBound) / (from.upperBound - from.lowerBound)) * (to.upperBound - to.lowerBound) + to.lowerBound
        return result
    }
}

