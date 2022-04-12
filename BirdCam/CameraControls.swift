//
import SwiftUI

struct CameraButtonView: View {
    let title: String
    let action: () -> ()

    var body: some View {
        Button(action: {}) {
            VStack {
                Text(title)
            }
        }
        .border(Color.gray, width: 2)
        .frame(maxWidth: .infinity)
    }
}

struct CameraControls: View {
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                CameraButtonView(title: "360 degrees") {
                    print("rot")

                    

                }

                CameraButtonView(title: "Traveling") {
                    print("travel")
                }

                CameraButtonView(title: "From top") {
                    print("heads down")
                }
            }
            .foregroundColor(Color.white)
            .frame(height: 134)
            .frame(maxWidth: .infinity)
            .background(Color.init(rgb: 0x262629))
        }
        .ignoresSafeArea()
    }
}

struct CameraControls_Previews: PreviewProvider {
    static var previews: some View {
        CameraControls()
    }
}
