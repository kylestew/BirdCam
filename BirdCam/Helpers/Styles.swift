import SwiftUI

struct RoundedCornerStyle: ViewModifier {
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content.mask(RoundedRectangle(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color.white.opacity(0.08))
            )
    }
}

extension View {
    func roundedCornerStyle(cornerRadius: CGFloat = 20) -> some View {
        modifier(RoundedCornerStyle(cornerRadius: cornerRadius))
    }
}
