import SwiftUI

struct TrajectoryOptionsView: View {

    let title: String
    let setting: String

    var body: some View {
        ZStack {
            LinearGradient(colors: [
                Color.white.opacity(0.0),
                Color.white.opacity(0.05)
            ], startPoint: .top, endPoint: .bottom)

            VStack {
                Text(title)
                    .font(.system(size: 10))
                    .lineLimit(1)
                    .foregroundColor(.white).opacity(0.6)

                Image("gadget")

                Text(setting)
                    .font(.system(size: 10))
                    .lineLimit(1)
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
    @EnvironmentObject var appState: AppState

    let cameraTrajectory: CameraTrajectory
    let isSelected: Bool
    let width: CGFloat
    let didSelect: () -> Void

    private var openWidth: CGFloat {
        width * 2.55
    }

    private var optionCellWidth: CGFloat {
        width - (8 * 3 + 12 * 2 / 3)
    }

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                if isSelected {
                    appState.selectedCameraControl = nil
                } else {
                    appState.selectedCameraControl = cameraTrajectory
                }
                didSelect()
            }
        }) {
            ZStack {
                Color("Background")

                LinearGradient(colors: [
                    Color("Background").opacity(0.0),
                    Color("FunGradientEnd").opacity(0.2)
                ], startPoint: .top, endPoint: .bottom)
                .opacity(isSelected ? 1 : 0)

                if isSelected {
                    VStack {
                        HStack {
                            Image("check")
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                }

                HStack(spacing: 8) {
                    VStack(spacing: 0) {
                        Image(cameraTrajectory.image)
                        Text(cameraTrajectory.title)
                            .lineLimit(1)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                    }

                    if isSelected {
                        TrajectoryOptionsView(title: "Velocity",
                                              setting: "Linear"
                        )
                        .frame(width: optionCellWidth)
                        .roundedCornerStyle()
                        TrajectoryOptionsView(title: "Cam. Height",
                                              setting: "Middle"
                        )
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
        CameraTrajectoryButtonView(
            cameraTrajectory: .rotate,
            isSelected: false,
            width: 112
        ) {}
        .frame(height: 134)
        .background(Color.black)
    }
}
