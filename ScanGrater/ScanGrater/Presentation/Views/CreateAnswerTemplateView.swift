import SwiftUI

struct CreateAnswerTemplateView: View {
    
    @ObservedObject var viewModel: AnswerTemplateViewModel
    
    init(viewModel: AnswerTemplateViewModel) {
        self.viewModel = viewModel
    }

    @State private var templateName: String = ""
    @State private var selectedDate: Date = Date.now
    @State private var numberOfQuestions: Int = 1
    @State private var numberOfAnswers: Int = 2
    @State private var moreThanOneAnswer: Bool = false
    @State private var correctAnswerScore: Float? = nil
    @State private var wrongAnswerPenalty: Float? = nil
    @State private var blankAnswerPenalty: Float? = nil
    
    @State private var navigateToAnswerForm = false
    @State private var navigateToCanceledQuestionsForm = false

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                
                MainText(text: "Crear plantilla",
                         textColor: Color("AppPrimaryColor"),
                         font: .title2)
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        MainTextField(placeholder: "Nombre de la plantilla",
                                      text: $templateName,
                                      autoCapitalize: false,
                                      autoCorrection: false)
                        
                        MainDatePicker(selectedDate: $selectedDate)
                        
                        MainNumberPicker(placeholder: "Número de preguntas",
                                         minValue: 1,
                                         maxValue: 100,
                                         selectedValue: numberOfQuestions)
                        
                        MainNumberPicker(placeholder: "Número de respuestas",
                                         minValue: 2,
                                         maxValue: 8,
                                         selectedValue: numberOfAnswers)
                        
                        
                        MainToggle(placeholder: "¿Más de una respuesta correcta?",
                                   isPressed: $moreThanOneAnswer,
                                   pressedText: "Sí",
                                   nonPressedText: "No")
                        
                        MainNumberTextField(placeholder: "Puntuación por respuesta correcta",
                                            number: $correctAnswerScore)
                        
                        MainNumberTextField(placeholder: "Penalización por respuesta incorrecta",
                                            number: $wrongAnswerPenalty)
                        
                        MainNumberTextField(placeholder: "Penalización por respuesta en blanco",
                                            number: $blankAnswerPenalty)
                        
                       
                        Button(action: {
                            navigateToAnswerForm = true
                        }, label: {
                            NavigationButton(navigationTitle: "Respuestas correctas")
                        })
                        
                        Button(action: {
                            navigateToCanceledQuestionsForm = true
                        }, label: {
                            NavigationButton(navigationTitle: "Preguntas anuladas")
                        })
                        
                        
                        
                        Spacer()
                    }
                }
                MainButton(title: "Guardar", action: {})
            }
            .padding()
            .navigationDestination(isPresented: $navigateToAnswerForm) {
                AnswerListView(numberOfQuestions: numberOfQuestions,
                               numberOfAnswers: numberOfAnswers)
                    .transition(.slide)
            }
            .navigationDestination(isPresented: $navigateToCanceledQuestionsForm) {
                CanceledQuestionsListView(numberOfQuestions: numberOfQuestions)
                    .transition(.slide)
            }
        }
    }
}
