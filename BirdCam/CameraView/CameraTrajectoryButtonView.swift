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
        switch self {
        case .rotate:
            return Image("CameraOptionButtons-Rotate")
        case .travel:
            return Image("CameraOptionButtons-Traveling")
        case .fromTop:
            return Image("CameraOptionButtons-FromTop")
        }
    }

    func action() {}
}

struct TrajectoryOptionsView: View {

    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color.white.opacity(0.0),
                Color.white.opacity(0.05)
            ], startPoint: .top, endPoint: .bottom)

            VStack {
                Text("Velocity")
                    .font(.system(size: 11))
                    .foregroundColor(.white).opacity(0.6)

                Spacer()

                Text("Linear")
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color.white.opacity(0.05))
                    .roundedCornerStyle()
            }
            .padding(8)
        }
    }
}

struct CameraTrajectoryButtonView: View {

    @State var isSelected = false

    let cameraTrajectory: CameraTrajectory
    let width: CGFloat

    private var openWidth: CGFloat {
        width * 2.55
    }

    private var optionCellWidth: CGFloat {
        width - (8 * 3 + 12 * 2 / 3)
    }

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                isSelected.toggle()
            }
        }) {
            ZStack {
                Color("Background")

                LinearGradient(colors: [
                    Color("Background").opacity(0.0),
                    Color("FunGradientEnd").opacity(0.2)
                ], startPoint: .top, endPoint: .bottom)
                .opacity(isSelected ? 1 : 0)

                HStack(spacing: 8) {
                    VStack(spacing: 0) {
                        cameraTrajectory.image
                        Text(cameraTrajectory.title)
                            .lineLimit(1)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }

                    if isSelected {
                        TrajectoryOptionsView()
                            .frame(width: optionCellWidth)
                            .roundedCornerStyle()
                        TrajectoryOptionsView()
                            .frame(width: optionCellWidth)
                            .roundedCornerStyle()
                    }
                }
                .padding(12)
            }
        }
        .frame(width: isSelected ? openWidth : width)
        .frame(maxHeight: .infinity)
        .roundedCornerStyle()
    }
}


struct CameraOptionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CameraTrajectoryButtonView(cameraTrajectory: .rotate, width: 112)
            .frame(height: 134)
            .background(Color.black)
    }
}
