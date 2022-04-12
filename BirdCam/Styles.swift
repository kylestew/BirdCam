import SwiftUI

struct StrokeStyle: ViewModifier {

//    @Environment(\.colorScheme) var colorScheme

    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.overlay(
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(
                    .linearGradient(colors: [
                        .black.opacity(0.3),
                    ], startPoint: .top, endPoint: .bottom)
                )
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
