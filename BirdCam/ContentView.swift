import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.white
            RadialGradient(gradient: Gradient(colors: [
                .black.opacity(0.7),
                .black
            ]), center: .center, startRadius: 100, endRadius: 800)

            // TODO: render view goes behind everything
            Image("bird")
                .frame(maxHeight: .infinity)
                .offset(y: -90)

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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
