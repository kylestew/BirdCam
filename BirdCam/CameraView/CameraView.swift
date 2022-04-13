import SwiftUI

struct CameraView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("rotational velocity: \(appState.rotationVelocity)")
                .font(.system(size: 10))
                .foregroundColor(.white)

            Spacer()

            RotationalSliderView()

            Spacer()

            Text("Camera")
                .font(.system(size: 12))
                .foregroundColor(.white)

            CameraControls()
                .background(Color("Background"))
                .mask(RoundedRectangle(cornerRadius: 26))
                .padding(8)
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .environmentObject(AppState())
    }
}
