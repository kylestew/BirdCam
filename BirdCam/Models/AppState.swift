import Foundation

class AppState: ObservableObject {

    // how much rotation velocity we are running
    // based on how far user is pulling over thingy
//    var rotationVelocity: Float

    @Published var selectedCameraControl: CameraTrajectory?

}

enum CameraTrajectory: Int, CaseIterable, Identifiable {

    case rotate
    case travel
    case fromTop

    var id: Int {
        rawValue
    }

    var title: String {
        switch self {
        case .rotate:
            return "360 degrees"
        case .travel:
            return "Traveling"
        case .fromTop:
            return "From top"
        }
    }

    var image: String {
        switch self {
        case .rotate:
            return "CameraOptionButtons-Rotate"
        case .travel:
            return "CameraOptionButtons-Traveling"
        case .fromTop:
            return "CameraOptionButtons-FromTop"
        }
    }
}

