// Import the UIKit framework
// You're almost always going to need this when your referencing UI elements in your file
import UIKit

// Class declaration, including the name of the class and its subclass (UIViewController)
class TriviaViewController: UIViewController {

    var currentQuestionIndex = 0
    var correctAnswers = 0


    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var correctAnswersLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    var questions: [(question: String, answers: [String], correctAnswerIndex: Int)] = [
            ("Capital of California", ["San Francisco", "San Jose", "Sacramento", "Los Angeles"], 2),
            ("Capital of Texas", ["Houston", "Austin", "Dallas", "Fort Worth"], 1),
            ("Capital of New York", ["Albany", "Rochester", "Buffalo", "New York City"], 0),
            ("Capital of Florida", ["Tallahassee", "Orlando", "Tampa", "Miami"], 0),
            ("End of Trivia", [" ", " ", " ", " "], 0)
        ]
    
    // Function override for the view controller
    // This is fired when the view has finished loading for the first time
    override func viewDidLoad() {
        // Some functions require you to call the super class implementation
        // Always read the online documentation to know if you need to
        super.viewDidLoad()
        // Display the first question
        displayQuestion()
    }
    
    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        
        // Set titles for individual answer buttons
        answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
    }
        
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let currentQuestion = questions[currentQuestionIndex]
        // Get the selected answer index by comparing the sender button with each answer button outlet
        var selectedAnswerIndex = -1
        if sender == answerButton1 {
            selectedAnswerIndex = 0
        } else if sender == answerButton2 {
            selectedAnswerIndex = 1
        } else if sender == answerButton3 {
            selectedAnswerIndex = 2
        } else if sender == answerButton4 {
            selectedAnswerIndex = 3
        }
        
        // Ensure a valid selected answer index
        guard selectedAnswerIndex != -1 else {
            return
        }
        
        if selectedAnswerIndex == currentQuestion.correctAnswerIndex {
            correctAnswers += 1
            correctAnswersLabel.text = "Correct Answers: \(correctAnswers)/4"
        }
        
        // Move to the next question
        if currentQuestionIndex < questions.count {currentQuestionIndex += 1}
        if currentQuestionIndex < questions.count {
            // If there are more questions, display the next one
            displayQuestion()
        } else {
            // If all questions have been answered, show end game logic
            // You can display a message or perform any other actions here
            print("End of trivia")
        }
    }
}

