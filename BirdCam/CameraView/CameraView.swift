import SwiftUI

/* Top Nav + Camera Render View + Camera Controls */
struct CameraView: View {
    var body: some View {
        ZStack {
            Color.white
            RadialGradient(gradient: Gradient(colors: [
                .black.opacity(0.7),
                .black
            ]), center: .center, startRadius: 100, endRadius: 800)

            Image("bird")
                .offset(y: -90)

            VStack {
                TopNavView()
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 54)
                })

                Spacer()

                Text("Camera")
                    .font(.system(size: 12))
                    .foregroundColor(.white)

                CameraControls()
                    .background(Color("Background"))
                    .mask(RoundedRectangle(cornerRadius: 20))
                    .padding(8)

                Spacer().frame(height: 80)
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
