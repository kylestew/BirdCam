import SwiftUI

/* Top Nav + Camera Render View + Camera Controls */
struct CameraView: View {
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()

            Text("NAV STACK")

//            Rectangle()
//                .frame(maxWidth: .infinity)
//                .frame(maxHeight: .infinity)
//                .strokeStyle()
//
//            CameraControls()
        }
        .ignoresSafeArea()
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
