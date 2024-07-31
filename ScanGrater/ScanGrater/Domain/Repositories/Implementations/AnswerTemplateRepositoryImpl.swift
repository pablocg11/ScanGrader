
import CoreData
import SwiftUI

class AnswerTemplateRepository: AnswerTemplateRepositoryType {
    private let viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.viewContext = viewContext
    }

    func add(template: AnswerTemplate) {
        let entity = AnswerTemplateEntity(context: viewContext)
        entity.id = template.id
        entity.name = template.name
        entity.date = template.date
        entity.numberOfQuestions = Int16(template.numberOfQuestions)
        entity.numberOfAnswersPerQuestion = Int16(template.numberOfAnswersPerQuestion)
        entity.multipleCorrectAnswers = template.multipleCorrectAnswers
        entity.scoreCorrectAnswer = template.scoreCorrectAnswer
        entity.penaltyIncorrectAnswer = template.penaltyIncorrectAnswer
        entity.penaltyBlankAnswer = template.penaltyBlankAnswer
        entity.disabledQuestions = template.disabledQuestions as [Bool]
        entity.correctAnswersMatrix = template.correctAnswersMatrix as [[Bool]]

        for student in template.evaluatedStudents {
            let studentEntity = EvaluatedStudentEntity(context: viewContext)
            studentEntity.id = student.id
            studentEntity.dni = student.dni
            studentEntity.answerMatrix = student.answerMatrix as [[Bool]]
            studentEntity.template = entity
            entity.addToEvaluatedStudents(studentEntity)
        }

        saveContext()
    }

    func getAllTemplates() -> [AnswerTemplate] {
        let request: NSFetchRequest<AnswerTemplateEntity> = AnswerTemplateEntity.fetchRequest()
        do {
            let entities = try viewContext.fetch(request)
            return entities.map { entity in
                let evaluatedStudents = entity.evaluatedStudents?.allObjects as? [EvaluatedStudentEntity] ?? []
                let students = evaluatedStudents.map { studentEntity in
                    return EvaluatedStudent(
                        id: studentEntity.id ?? UUID(),
                        dni: studentEntity.dni ?? "",
                        answerMatrix: studentEntity.answerMatrix ?? []
                    )
                }
                return AnswerTemplate(
                    id: entity.id ?? UUID(),
                    name: entity.name ?? "",
                    date: entity.date ?? Date(),
                    numberOfQuestions: Int(entity.numberOfQuestions),
                    numberOfAnswersPerQuestion: Int(entity.numberOfAnswersPerQuestion),
                    multipleCorrectAnswers: entity.multipleCorrectAnswers,
                    scoreCorrectAnswer: entity.scoreCorrectAnswer,
                    penaltyIncorrectAnswer: entity.penaltyIncorrectAnswer,
                    penaltyBlankAnswer: entity.penaltyBlankAnswer,
                    disabledQuestions: entity.disabledQuestions ?? [],
                    correctAnswersMatrix: entity.correctAnswersMatrix ?? [],
                    evaluatedStudents: students
                )
            }
        } catch {
            print("Failed to fetch templates: \(error)")
            return []
        }
    }

    func deleteTemplate(id: UUID) {
        let request: NSFetchRequest<AnswerTemplateEntity> = AnswerTemplateEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            if let entity = try viewContext.fetch(request).first {
                viewContext.delete(entity)
                saveContext()
            }
        } catch {
            print("Failed to delete template: \(error)")
        }
    }

    func updateTemplate(template: AnswerTemplate) {
        let request: NSFetchRequest<AnswerTemplateEntity> = AnswerTemplateEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", template.id as CVarArg)
        do {
            if let entity = try viewContext.fetch(request).first {
                entity.name = template.name
                entity.date = template.date
                entity.numberOfQuestions = Int16(template.numberOfQuestions)
                entity.numberOfAnswersPerQuestion = Int16(template.numberOfAnswersPerQuestion)
                entity.multipleCorrectAnswers = template.multipleCorrectAnswers
                entity.scoreCorrectAnswer = template.scoreCorrectAnswer
                entity.penaltyIncorrectAnswer = template.penaltyIncorrectAnswer
                entity.penaltyBlankAnswer = template.penaltyBlankAnswer
                entity.disabledQuestions = template.disabledQuestions as [Bool]
                entity.correctAnswersMatrix = template.correctAnswersMatrix as [[Bool]]
                
                for student in template.evaluatedStudents {
                    if let studentEntity = entity.evaluatedStudents?.first(where: { ($0 as? EvaluatedStudentEntity)?.id == student.id }) as? EvaluatedStudentEntity {
                        studentEntity.dni = student.dni
                        studentEntity.answerMatrix = student.answerMatrix as [[Bool]]
                    } else {
                        let studentEntity = EvaluatedStudentEntity(context: viewContext)
                        studentEntity.id = student.id
                        studentEntity.dni = student.dni
                        studentEntity.answerMatrix = student.answerMatrix as [[Bool]]
                        studentEntity.template = entity
                        entity.addToEvaluatedStudents(studentEntity)
                    }
                }

                saveContext()
            }
        } catch {
            print("Failed to update template: \(error)")
        }
    }

    private func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
