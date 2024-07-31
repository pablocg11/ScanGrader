import SwiftUI

struct CanceledQuestionsListView: View {
    
    @State var numberOfQuestions: Int
    @Environment(\.presentationMode) var presentationMode
    
    @State private var selectedQuestions: Set<Int> = []
    
    var body: some View {
        VStack(alignment: .leading) {
            
            NavigationHeader(headerTitle: "Preguntas anuladas", action: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(1...numberOfQuestions, id: \.self) { question in
                        MainRadioButton(
                            option: "Pregunta \(question)",
                            isSelected: Binding(
                                get: {
                                    selectedQuestions.contains(question)
                                },
                                set: { newValue in
                                    if newValue {
                                        selectedQuestions.insert(question)
                                    } else {
                                        selectedQuestions.remove(question)
                                    }
                                }
                            )
                        )
                    }
                }
                .padding()
            }
            
            MainButton(title: "Guardar") {
                print("Selected questions: \(selectedQuestions)")
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CanceledQuestionsListView(numberOfQuestions: 10)
}
