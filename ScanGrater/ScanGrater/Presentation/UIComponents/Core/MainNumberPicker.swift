import SwiftUI

struct MainNumberPicker: View {
    var placeholder: String
    var minValue: Int
    var maxValue: Int
    @State var selectedValue: Int
    
    var body: some View {
        HStack {
            MainText(text: placeholder,
                     textColor: Color("AppPrimaryColor"),
                     font: .callout)
            Stepper("", value: $selectedValue,
                    in: minValue...maxValue)
            MainText(text: "\(selectedValue)",
                     textColor: Color("AppPrimaryColor"),
                     font: .headline,
                     fontWeight: .semibold)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5).stroke(Color("AppSecondaryColor"), lineWidth: 1))
        .background(Color("AppSecondaryColor"))
    }
}

struct MainNumberPicker_Previews: PreviewProvider {
    @State static var selectedValue = 5
    
    static var previews: some View {
        MainNumberPicker(placeholder: "Numero de preguntas",minValue: 1, maxValue: 10, selectedValue: selectedValue)
    }
}
