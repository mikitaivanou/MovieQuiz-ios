import UIKit

final class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentQuestion = questions[currentQuestionIndex]
        let quizStepModel = convert(model: currentQuestion)
        show(quiz: quizStepModel)
    }
    private let questions: [QuizQuestion] = [
        QuizQuestion(image: "Deadpool", text: "Рейтинг этого фильма выше 8?", correctAnswer: true),
        QuizQuestion(image: "Kill Bill", text: "Рейтинг этого фильма выше 7?", correctAnswer: false),
        QuizQuestion(image: "Old", text: "Рейтинг этого фильма выше 6?", correctAnswer: false),
        QuizQuestion(image: "Tesla", text: "Рейтинг этого фильма выше 7?", correctAnswer: true),
        QuizQuestion(image: "The Avengers", text: "Рейтинг этого фильма выше 8?", correctAnswer: true),
        QuizQuestion(image: "The Dark Knight", text: "Рейтинг этого фильма выше 9?", correctAnswer: true),
        QuizQuestion(image: "The Godfather", text: "Рейтинг этого фильма ниже 7?", correctAnswer: false),
        QuizQuestion(image: "The Green Knight", text: "Рейтинг этого фильма выше 6?", correctAnswer: false),
        QuizQuestion(image: "The Ice Age Adventures of Buck Wild", text: "Рейтинг этого фильма выше 5?", correctAnswer: true),
        QuizQuestion(image: "Vivarium", text: "Рейтинг этого фильма ниже 6?", correctAnswer: true)]
   
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let image = UIImage(named: model.image) ?? UIImage()
              let questionNumber = "\(currentQuestionIndex + 1)/\(questions.count)"
        
        return QuizStepViewModel(image: image,
                                 question: model.text,
                                 questionNumber: questionNumber)
    }
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    struct QuizQuestion {
        let image: String
        let text: String
        let correctAnswer: Bool
    }
   
    struct QuizStepViewModel {
      let image: UIImage
      let question: String
      let questionNumber: String
    }
    
    private func show(quiz step: QuizStepViewModel) {
      imageView.image = step.image
      textLabel.text = step.question
      counterLabel.text = step.questionNumber
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
    }
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
}

/*
 Mock-данные
 
 
 Картинка: The Godfather
 Настоящий рейтинг: 9,2
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Dark Knight
 Настоящий рейтинг: 9
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Kill Bill
 Настоящий рейтинг: 8,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Avengers
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Deadpool
 Настоящий рейтинг: 8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: The Green Knight
 Настоящий рейтинг: 6,6
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: ДА
 
 
 Картинка: Old
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: The Ice Age Adventures of Buck Wild
 Настоящий рейтинг: 4,3
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Tesla
 Настоящий рейтинг: 5,1
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
 
 
 Картинка: Vivarium
 Настоящий рейтинг: 5,8
 Вопрос: Рейтинг этого фильма больше чем 6?
 Ответ: НЕТ
*/
