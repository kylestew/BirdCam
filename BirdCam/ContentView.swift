import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
            RadialGradient(gradient: Gradient(colors: [
                .black.opacity(0.75),
                .black
            ]), center: .center, startRadius: 100, endRadius: 800)

            MetalView()
            
            LinearGradient(gradient: Gradient(colors: [
                .black.opacity(0),
                .black.opacity(0.9),
            ]), startPoint: .top, endPoint: .bottom)
            .frame(height: 300)

            VStack {
                TopNavView()

                CameraView()

                TabBarView()
            }
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 24)
            })
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 54)
            })
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .environmentObject(AppState())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
