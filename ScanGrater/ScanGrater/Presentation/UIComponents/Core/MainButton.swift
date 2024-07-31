
import SwiftUI

struct MainButton: View {
    var title: String
    var action: () -> Void
    var cornerRadius: CGFloat?

    var body: some View {
        Button(action: action) {
            Text(title)
                .textCase(.uppercase)
                .padding()
                .foregroundColor(Color("AppSecondaryColor"))
                .frame(maxWidth: .infinity)
                .background(Color("AppPrimaryColor"))
                .cornerRadius(cornerRadius ?? 10)
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Press Me", action: {
            print("Button pressed")
        })
    }
}
