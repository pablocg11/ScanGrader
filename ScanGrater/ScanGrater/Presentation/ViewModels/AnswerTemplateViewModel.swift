
import Foundation

class AnswerTemplateViewModel: ObservableObject {
    
    private let createAnswerTemplateUseCase: CreateAnswerTemplateUseCaseType
    private let deleteAnswerTemplateUseCase: DeleteTemplateUseCaseType
    private let updateAnswerTemplateUseCase: UpdateAnswerTemplateUseCaseType
    private let getAnswerTemplateUseCase: GetAnswerTemplatesUseCaseType

    init(createAnswerTemplateUseCase: CreateAnswerTemplateUseCaseType,
         deleteAnswerTemplateUseCase: DeleteTemplateUseCaseType,
         updateAnswerTemplateUseCase: UpdateAnswerTemplateUseCaseType,
         getAnswerTemplateUseCase: GetAnswerTemplatesUseCaseType) {
        self.createAnswerTemplateUseCase = createAnswerTemplateUseCase
        self.deleteAnswerTemplateUseCase = deleteAnswerTemplateUseCase
        self.updateAnswerTemplateUseCase = updateAnswerTemplateUseCase
        self.getAnswerTemplateUseCase = getAnswerTemplateUseCase
    }
    
    @Published var showLoading: Bool = false
    @Published var errorMessage: String?
    
    func createAnswerTemplate(name: String,
                                  date: Date,
                                  numberOfQuestions: Int,
                                  numberOfAnswersPerQuestion: Int,
                                  multipleCorrectAnswers: Bool,
                                  scoreCorrectAnswer: Double,
                                  penaltyIncorrectAnswer: Double,
                                  penaltyBlankAnswer: Double,
                                  disabledQuestions: [Bool],
                              correctAnswersMatrix: [[Bool]]) {
        showLoading = true
        Task {
            do {
                let template = AnswerTemplate(
                    id: UUID(),
                    name: name,
                    date: date,
                    numberOfQuestions: numberOfQuestions,
                    numberOfAnswersPerQuestion: numberOfAnswersPerQuestion,
                    multipleCorrectAnswers: multipleCorrectAnswers,
                    scoreCorrectAnswer: scoreCorrectAnswer,
                    penaltyIncorrectAnswer: penaltyIncorrectAnswer,
                    penaltyBlankAnswer: penaltyBlankAnswer,
                    disabledQuestions: disabledQuestions,
                    correctAnswersMatrix: correctAnswersMatrix,
                    evaluatedStudents: []
                )
                createAnswerTemplateUseCase.execute(template: template)
                showLoading = false
            }
        }
    }
}
