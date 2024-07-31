import SwiftUI

struct MainNumberTextField: View {
    var placeholder: String
    @Binding var number: Float?

    var body: some View {
        HStack {
            Text(placeholder)
                .foregroundColor(Color("AppPrimaryColor"))

            Spacer()

            TextField("", value: Binding(
                get: { number ?? 0 },
                set: { number = $0 }
            ), formatter: NumberFormatter())
            .keyboardType(.decimalPad)
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color("AppPrimaryColor"))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("AppSecondaryColor"), lineWidth: 1)
        )
        .background(Color("AppSecondaryColor"))
        .cornerRadius(5)
    }
}

struct MainNumberTextField_Previews: PreviewProvider {
    @State static var sampleNumber: Float? = nil

    static var previews: some View {
        MainNumberTextField(placeholder: "Enter number", number: $sampleNumber)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
