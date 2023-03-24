//
//  ResultViewController.swift
//  personalQuiz
//
//  Created by Kyunghyun Lee on 2023/03/10.
//

import UIKit

class ResultViewController: UIViewController {

    var responses: [Answer] = []
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true //백버튼없애기
        // Do any additional setup after loading the view.
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswer : [AnimalType: Int] = [:]
        
        let responseTypes = responses.map{$0.type}
        for response in responseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        let frequentAnswersSorted = frequencyOfAnswer.sorted(by:{ (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a\(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
//26-29축약하면..
//    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
