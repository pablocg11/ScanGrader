
import SwiftUI

struct AnswerFormCard: View {
    @State var question: String
    @State var numberOfAnswers: Int
    @State var selectedAnswer: String? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question)
                .foregroundColor(Color("AppPrimaryColor"))
                .font(.headline)
                .fontWeight(.semibold)
            
            ForEach(0..<numberOfAnswers, id: \.self) { index in
                let answerOption = String(UnicodeScalar(65 + index)!)
                MainRadioButton(option: answerOption,
                                isSelected: Binding<Bool>(
                                    get: { self.selectedAnswer == answerOption },
                                    set: { newValue in
                                        if newValue {
                                            self.selectedAnswer = answerOption
                                        }
                                    }
                                )
                )
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("AppSecondaryColor"), lineWidth: 1)
                .background(Color("AppSecondaryColor"))
                .cornerRadius(5)
        )
    }
}

#Preview {
    AnswerFormCard(question: "¿Pregunta de ejemplo?",
                   numberOfAnswers: 4)
}
