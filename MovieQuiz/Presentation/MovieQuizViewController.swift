import UIKit

final class MovieQuizViewController: UIViewController {
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentQuestion = questions[currentQuestionIndex]
        let quizStepModel = convert(model: currentQuestion)
        show(quiz: quizStepModel)
        imageView.layer.cornerRadius = 10
    }
    
    private var buttonValue = Bool()
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(image: "Deadpool", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "Kill Bill", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "Old", text: "Рейтинг этого фильма выше 6?", correctAnswer: false),
        QuizQuestion(image: "Tesla", text: "Рейтинг этого фильма выше 6?", correctAnswer: false),
        QuizQuestion(image: "The Avengers", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "The Dark Knight", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "The Godfather", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "The Green Knight", text: "Рейтинг этого фильма выше 6?", correctAnswer: true),
        QuizQuestion(image: "The Ice Age Adventures of Buck Wild", text: "Рейтинг этого фильма выше 6?", correctAnswer: false),
        QuizQuestion(image: "Vivarium", text: "Рейтинг этого фильма выше 6?", correctAnswer: false)]
    
    private var currentQuestionIndex = 0
    
    private var correctAnswers = 0
    
    private var answer: Bool {
        return questions[currentQuestionIndex].correctAnswer
    }
    
    @IBOutlet private var noButton: UIButton!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    
    private struct QuizQuestion {
         let image: String
         let text: String
         let correctAnswer: Bool
     }
    
    private struct QuizStepViewModel {
       let image: UIImage
       let question: String
       let questionNumber: String
     }
     
    private struct QuizResultsViewModel {
       let title: String
       let text: String
       let buttonText: String
     }
    
    private func show(quiz result: QuizResultsViewModel){
        let alert = UIAlertController(
            title: result.title,
            message: result.text,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: result.buttonText, style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
           
        let firstQuestion = self.questions[self.currentQuestionIndex]
        let viewModel = self.convert(model: firstQuestion)
            self.show(quiz: viewModel)
        }
        
        alert.addAction(action)
        
            self.present(alert, animated: true, completion: nil)
    }
  
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let image = UIImage(named: model.image) ?? UIImage()
              let questionNumber = "\(currentQuestionIndex + 1)/\(questions.count)"
        
        return QuizStepViewModel(image: image,
                                 question: model.text,
                                 questionNumber: questionNumber)
    }
   
    private func show(quiz step: QuizStepViewModel) {
      imageView.image = step.image
      textLabel.text = step.question
      counterLabel.text = step.questionNumber
    
        imageView.layer.borderWidth = 0
           imageView.layer.borderColor = UIColor.clear.cgColor
    }
  
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        buttonValue = false
        showAnswerResult(isCorrect: answer)
        
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        buttonValue = true
        showAnswerResult(isCorrect: answer)
    }
   
    private func showNextQuestionOrResults() {
        if currentQuestionIndex == questions.count - 1 {
            let text = "Ваш результат: \(correctAnswers)/10"
                   let viewModel = QuizResultsViewModel(
                       title: "Этот раунд окончен!",
                       text: text,
                       buttonText: "Сыграть ещё раз")
                   show(quiz: viewModel)
        } else {
           currentQuestionIndex += 1
            let nextQuestion = questions[currentQuestionIndex]
                   let viewModel = convert(model: nextQuestion)
                   
                   show(quiz: viewModel)}
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        yesButton.isEnabled = false
        noButton.isEnabled = false
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 8
        imageView.layer.masksToBounds = true
        if isCorrect == buttonValue {
                  imageView.layer.borderColor = UIColor.ypGreen.cgColor
           
            correctAnswers += 1
                 print(correctAnswers)//проверка подсчета очков для консоли
           
        } else {
                    imageView.layer.borderColor = UIColor.ypRed.cgColor
         
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.yesButton.isEnabled = true
            self.noButton.isEnabled = true
            self.showNextQuestionOrResults()
        }
    }
    
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
