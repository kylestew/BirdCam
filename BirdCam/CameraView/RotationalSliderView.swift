import SwiftUI

struct RotationalSliderView: View {
    var body: some View {
        ZStack {
            Image("rotation-hint")
                .offset(y: -10)

            Image(systemName: "video")
                .resizable()
                .frame(width: 16, height: 11)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .padding(.horizontal, 14)
                .padding(.vertical, 16)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
                .roundedCornerStyle(cornerRadius: 12)
                .opacity(0.9)
                .foregroundColor(Color.white)
                .modifier(DraggableView())
        }
    }
}

struct DraggableView: ViewModifier {
    @State var offset = CGPoint(x: 0, y: 0)

    func body(content: Content) -> some View {
        content
            .gesture(DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.offset.x += value.location.x - value.startLocation.x
                })
            .offset(x: offset.x, y: offset.y)
    }
}

struct RotationalSliderView_Previews: PreviewProvider {
    static var previews: some View {
        RotationalSliderView()
            .frame(width: 375, height: 200)
            .background(Color.black)
    }
}
