import SwiftUI

struct CameraControls: View {

    var body: some View {
        VStack {
            GeometryReader { proxy in
                // 3 cells with 2 spaces (8pts)
                let cellWidth: CGFloat = (proxy.size.width - (8 * 4)) / 3
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(CameraTrajectory.allCases) { trajectory in
                            CameraTrajectoryButtonView(cameraTrajectory: trajectory, width: cellWidth)
                                .frame(height: 134)
                        }
                    }
                    .padding(8)
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
    }
}
