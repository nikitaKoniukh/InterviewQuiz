//
//  ViewController.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 29/07/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {

    //Outlets
    @IBOutlet weak var scoreLabel: UIBarButtonItem!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var qestionTitleLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!

    @IBOutlet weak var optionA: RoundedButton!
    @IBOutlet weak var optionB: RoundedButton!
    @IBOutlet weak var optionC: RoundedButton!
    @IBOutlet weak var optionD: RoundedButton!
    @IBOutlet weak var optionE: RoundedButton!

    @IBOutlet var optionButtons: [RoundedButton]!

    //Variables
    let dataService = DataService()
    var questions = [QuestionModel]()
    var questionNumber = Int()
    var selectedAnswer: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleQuestions()
        pickQuestion()
    }

    fileprivate func shuffleQuestions() {
        self.questions = dataService.question().shuffled()
    }

    fileprivate func pickQuestion() {
        if questions.count > 0 {
            questionNumber = 0
            qestionTitleLabel.text = questions[questionNumber].questionTitle
            questionImage.image = UIImage(named: questions[questionNumber].questionImage)

            for i in 0..<optionButtons.count {
                optionButtons[i].setTitle(questions[questionNumber].answers[i], for: .normal)
            }
        } else {

            print("finish!!!!!!!")
        }
    }

    @IBAction func submitAnswerBtnWasTapped(_ sender: UIButton) {
        checkRightAnswer()
        questions.remove(at: questionNumber)
        pickQuestion()
    }

    fileprivate func checkRightAnswer() {
        let rightAnswer = questions[questionNumber].rightAnswer
        if rightAnswer == selectedAnswer {
            print("ok")
        } else {
            print("no")
        }
    }

    @IBAction func optionButtonWasTapped(_ sender: UIButton) {
        let isAlreadySelected = sender.isSelected
        resetButtonStates()
        if !isAlreadySelected {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.6980392157, blue: 0.03921568627, alpha: 1)
            selectedAnswer = sender.tag
        }
    }

    fileprivate func resetButtonStates() {
        for button in optionButtons {
            button.isSelected = false
            button.backgroundColor = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)
        }
    }

}








