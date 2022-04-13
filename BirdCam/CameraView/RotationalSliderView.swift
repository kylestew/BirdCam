import SwiftUI
import Foundation

struct RotationalSliderView: View {
    @EnvironmentObject var appState: AppState

    private let maxThumbstickVisualOffset: CGFloat = 80.0

    private var thumbstickCurrentOffset: CGFloat {
        // map velocity range to display range
        // [-1.0, 1.0] -> [-maxThumbstickVisualOffset, maxThumbstickVisualOffset]
        CGFloat(appState.rotationVelocity.map(from: -1.0...1.0, to: -maxThumbstickVisualOffset...maxThumbstickVisualOffset))
    }

    private var thumbStickView: some View {
        Image(systemName: "video")
            .resizable()
            .foregroundColor(Color.white)
            .frame(width: 16, height: 11)
            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            .padding(.horizontal, 14)
            .padding(.vertical, 16)
            .background(Color.red.opacity(abs(appState.rotationVelocity) / 2.0))
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
            .roundedCornerStyle(cornerRadius: 12)
            .opacity(0.9)
    }

    var body: some View {
        ZStack {
            Image("rotation-hint")
                .offset(y: -10)

            thumbStickView
                .offset(x: thumbstickCurrentOffset)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            // TODO: use a logritmic value instead
                            let offset = value.location.x - value.startLocation.x
                            let newValue = Double(offset).map(from: -maxThumbstickVisualOffset...maxThumbstickVisualOffset, to: -1...1)
                            appState.rotationVelocity = min(max(newValue, -1), 1)
                        }
                        .onEnded { _ in
                            withAnimation(.easeOut) {
                                appState.rotationVelocity = 0.0
                            }
                        }
                    )
        }
    }
}

struct RotationalSliderView_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState()
        appState.rotationVelocity = 0.0

        return RotationalSliderView()
            .frame(width: 375, height: 200)
            .background(Color.black)
            .environmentObject(appState)
    }
}
