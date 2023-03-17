//
//  QuestionViewController.swift
//  personalQuiz
//
//  Created by Kyunghyun Lee on 2023/03/10.
//

import UIKit

class QuestionViewController: UIViewController {
    var questions: [Question] = [
        Question(text: "Which food do you like the most?", type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrot", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                    //                    Answer(text: "Cuddling", type: .rabbit)
                    //                    Answer(text: "Eating", type: .dog)
                 ]),
        Question(text: "Which activities do you enjoy?", type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .turtle),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .dog)
                 ]),
        Question(text: "How much do you enjoy car rides?", type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervous", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog)
                 ])
    ]
    
    var questionIndex = 0
    
    var answerChosen: [Answer] = []
    
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    
    @IBOutlet var multiSwitches: [UISwitch]!
    
    
    
    @IBOutlet weak var rangeStackView: UIStackView!
    
    @IBOutlet var rangedLabels: [UILabel]!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
        
        // navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            //singleStackView.isHidden = false
            updateSingleStack(using: currentAnswers)
        case .multiple:
            //multipleStackView.isHidden = false
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            //rangeStackView.isHidden = false
            updateRangeStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers:[Answer]){
        singleStackView.isHidden = false
        
        for i in 0...3 {
            singleButtons[i].setTitle(answers[i].text, for: .normal)
        }
        func updateMultipleStack(using answers:[Answer]) {
            multipleStackView.isHidden = false
            for i in 0...3{
                multiLabels[i].text = answers[i].text
            }
        }
        func updateRangeStack(using answers: [Answer]) {
            rangeStackView.isHidden = false
            rangedLabels[0].text = answers.first?.text
            rangedLabels[1].text = answers.last?.text
        }
        
        
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswer = question[questionIndex].answers
        switch sender {
        case singleButtons[0] :
            answersChosen.append(currentAnswer[0])
        case singleButtons[1] :
            answersChosen.append(currentAnswer[1])
        case singleButtons[2] :
            answerChosen.append(currentAnswer[2])
        case singleButtons[3] :
            answerChosen.append(currentAnswer[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    
    
}
