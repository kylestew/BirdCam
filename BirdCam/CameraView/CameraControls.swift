import SwiftUI

struct CameraControls: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            GeometryReader { proxy in
                // 3 cells with 2 spaces (8pts)
                let cellWidth: CGFloat = (proxy.size.width - (8 * 4)) / 3
                ScrollViewReader { value in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(CameraTrajectory.allCases) { trajectory in
                                CameraTrajectoryButtonView(
                                    cameraTrajectory: trajectory,
                                    isSelected: appState.selectedCameraControl == trajectory,
                                    width: cellWidth) {
                                        value.scrollTo(trajectory.id, anchor: .leading)
                                    }
                                    .frame(height: 134)
                            }
                        }
                    }
                    // this really feels like a hack :/
                    .safeAreaInset(edge: .leading, spacing: 0) {
                        Spacer().frame(width: 8)
                    }
                    .safeAreaInset(edge: .bottom, spacing: 0) {
                        Spacer().frame(width: 4)
                    }
                    .safeAreaInset(edge: .top, spacing: 0) {
                        Spacer().frame(width: 4)
                    }
                }
            }
            .frame(height: 150)
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: 20))
        }
    }
}

struct CameraControls_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            CameraControls()
                .padding(8)
            Spacer()
        }
        .background(Color("DropCloth"))
        .previewLayout(.fixed(width: 375, height: 300))
        .environmentObject(AppState())
    }
}
