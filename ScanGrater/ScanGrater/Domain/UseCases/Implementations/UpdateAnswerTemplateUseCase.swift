
import Foundation

class UpdateTemplateUseCase: UpdateAnswerTemplateUseCaseType {
    private let repository: AnswerTemplateRepository

    init(answerTemplateRepository: AnswerTemplateRepository) {
        self.repository = answerTemplateRepository
    }

    func execute(template: AnswerTemplate) {
        repository.updateTemplate(template: template)
    }
}

