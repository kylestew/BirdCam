import SwiftUI

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

    var image: Image {
        Image("CameraOptionButtons-Rotate")
    }

    func action() {}
}

struct CameraTrajectoryButtonView: View {
    let cameraTrajectory: CameraTrajectory

    var body: some View {
        Button(action: cameraTrajectory.action) {
            VStack(spacing: 0) {
                cameraTrajectory.image
                Text(cameraTrajectory.title)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .roundedCornerStyle()
    }
}


struct CameraOptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CameraTrajectoryButtonView(cameraTrajectory: .travel)
            .padding()
            .background(Color("DropCloth"))
            .previewLayout(.fixed(width: 130, height: 150))
    }
}
