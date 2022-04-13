import Foundation

class AppState: ObservableObject {

    // current camera trajectory option in camera view
    @Published var selectedCameraControl: CameraTrajectory?

    // rate at which model rotates - driven by thumbstick
    // normalized to [-1.0, 1.0]
    @Published var rotationVelocity: Double = 0.0

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

