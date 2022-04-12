import SwiftUI

struct TopNavView: View {
    var body: some View {
        HStack {
            Button(action:{}) {
                Text("Cancel")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
            }

            Spacer()

            Text("Bird")
                .font(.system(size: 17))
                .fontWeight(.semibold)

            Spacer()

            Button(action:{}) {
                Text("Export")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.black.opacity(0.05))
                    .roundedCornerStyle(cornerRadius: 12)
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 16)
    }
}

struct TopNavView_Previews: PreviewProvider {
    static var previews: some View {
        TopNavView()
    }
}
