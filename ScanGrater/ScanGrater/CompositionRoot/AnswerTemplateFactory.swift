
import Foundation

class AnswerTemplateFactory {
    
    func createView() -> CreateAnswerTemplateView {
        return CreateAnswerTemplateView(viewModel: createViewModel())
    }
    
    private func createViewModel() -> AnswerTemplateViewModel {
        return AnswerTemplateViewModel(createAnswerTemplateUseCase: createCreateAnswerTemplateUseCase(),
                                       deleteAnswerTemplateUseCase: createDeleteTemplateUseCase(),
                                       updateAnswerTemplateUseCase: createUpdateAnswerTemplateUseCase(),
                                       getAnswerTemplateUseCase: createGetAnswerTemplatesUseCase())
    }
    
    private func createCreateAnswerTemplateUseCase() -> CreateAnswerTemplateUseCase {
        return CreateAnswerTemplateUseCase(answerTemplateRepository: createRepository())
    }
    
    private func createDeleteTemplateUseCase() -> DeleteTemplateUseCase {
        return DeleteTemplateUseCase(answerTemplateRepository: createRepository())
    }
    
    private func createUpdateAnswerTemplateUseCase() -> UpdateTemplateUseCase {
        return UpdateTemplateUseCase(answerTemplateRepository: createRepository())
    }
    
    private func createGetAnswerTemplatesUseCase() -> GetAnswerTemplateUseCase{
        return GetAnswerTemplateUseCase(answerTemplateRepository: createRepository())
    }
    
    private func createRepository() -> AnswerTemplateRepository {
        return AnswerTemplateRepository()
    }
}
