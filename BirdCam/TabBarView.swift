import SwiftUI

struct TabBarView: View {
    let buttonImages = [
        "tab_bar_01",
        "tab_bar_02",
        "tab_bar_03",
        "tab_bar_04"
    ]

    var body: some View {
        HStack(spacing: 24) {
            ForEach(buttonImages, id: \.self) { image in
                Button(action: {}) {
                    Image(image)
                }
                .frame(width: 48, height: 48)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .padding()
            .background(Color.black)
    }
}
