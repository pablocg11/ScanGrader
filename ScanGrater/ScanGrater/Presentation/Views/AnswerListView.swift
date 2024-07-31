
import SwiftUI

struct AnswerListView: View {
    @State var numberOfQuestions: Int
    @State var numberOfAnswers: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading){
            
            NavigationHeader(headerTitle: "Respuestas", action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(1...numberOfQuestions, id: \.self){ answersForm in
                        AnswerFormCard(question: "Pregunta \(answersForm)",
                                       numberOfAnswers: numberOfAnswers)
                    }
                    
                }
            }
            MainButton(title: "Guardar", action: {})
                .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    AnswerListView(numberOfQuestions: 10, numberOfAnswers: 5)
}
