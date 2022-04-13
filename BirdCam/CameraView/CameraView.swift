import SwiftUI

struct CameraView: View {
    var body: some View {
        VStack {
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
    }
}
