//
//  ViewController.swift
//  English word practice
//
//  Created by Yuffie on 2022/3/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var answerButtonA: UIButton!
    @IBOutlet weak var answerButtonB: UIButton!
    @IBOutlet weak var answerButtonC: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pronunciationButton: UIButton!
    var index = 0
    let words = topic.shuffled()
    var isCorrect = false
    var numberOfCorrectAnswers = 0
    lazy var maximumIndex = words.count - 1
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.layer.cornerRadius = 20
        nextButton.layer.cornerRadius = 30
        setup()
    }

    @IBAction func nextTopic(_ sender: Any) {
        if index < maximumIndex {
            index += 1
        } else {
            index = 0
        }
        imageView.image = nil
        answerLabel.text = ""
        roundLabel.text = "Round  \(index + 1)"
        setup()
    }
    
    @IBAction func speake(_ sender: Any) {
    }
    
    @IBAction func hint(_ sender: Any) {
        answerLabel.text = words[index].answer
    }
    @IBAction func pressAnsButtonA(_ sender: Any) {
        checkAnswer(answerButtonA)
    }
    @IBAction func pressAnsButtonB(_ sender: Any) {
        checkAnswer(answerButtonB)
    }
    @IBAction func pressAnsButtonC(_ sender: Any) {
        checkAnswer(answerButtonC)
    }
    
    func checkAnswer(_ button: UIButton) {
        if button.titleLabel?.text == words[index].answer {
            isCorrect = true
        } else {
            isCorrect = false
        }
        transformImage()
    }
    func transformImage() {
        if isCorrect {
            imageView.image = UIImage(named: "o")
        } else {
            imageView.image = UIImage(named: "x")
        }
    }
    func setup() {
        let answers = setAnswer()
        questionLabel.text = words[index].question
        answerButtonA.setTitle(answers[0].answer, for: .normal)
        answerButtonB.setTitle(answers[1].answer, for: .normal)
        answerButtonC.setTitle(answers[2].answer, for: .normal)
    }
    func setAnswer() -> [TopicModel]{
        var answers:[TopicModel]
        var indexA = Int.random(in: 0..<maximumIndex)
        var indexB = Int.random(in: 0..<maximumIndex)
        while indexA == index && indexB == indexA {
            if indexA == index {
                indexA = Int.random(in: 0..<maximumIndex)
            }
            if indexB == indexA {
                indexB = Int.random(in: 0..<maximumIndex)
            }
        }
        answers = [words[index], words[indexA], words[indexB]]
        answers.shuffle()
        return answers
    }
}


