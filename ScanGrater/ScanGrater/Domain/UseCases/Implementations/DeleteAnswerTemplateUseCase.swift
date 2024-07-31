
import Foundation

class DeleteTemplateUseCase: DeleteTemplateUseCaseType {
    private let repository: AnswerTemplateRepository

    init(answerTemplateRepository: AnswerTemplateRepository) {
        self.repository = answerTemplateRepository
    }

    func execute(id: UUID) {
        repository.deleteTemplate(id: id)
    }
}
