

import Foundation

struct AnswerTemplate: Identifiable {
    var id: UUID
    var name: String
    var date: Date
    var numberOfQuestions: Int
    var numberOfAnswersPerQuestion: Int
    var multipleCorrectAnswers: Bool
    var scoreCorrectAnswer: Double
    var penaltyIncorrectAnswer: Double
    var penaltyBlankAnswer: Double
    var disabledQuestions: [Bool]
    var correctAnswersMatrix: [[Bool]]
    var evaluatedStudents: [EvaluatedStudent]
}
