import SwiftUI

/* Top Nav + Camera Render View + Camera Controls */
struct CameraView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("DropCloth")
                .ignoresSafeArea()

            VStack {
                Text("Camera")
                    .font(.system(size: 12))
                    .foregroundColor(.white)

                CameraControls()
                    .background(Color("Background"))
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .padding(8)

                Spacer().frame(height: 90)
            }
        }
        .ignoresSafeArea()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
