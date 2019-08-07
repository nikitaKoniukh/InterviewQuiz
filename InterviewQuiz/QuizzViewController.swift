//
//  QuizzViewController.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 29/07/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class QuizzViewController: UIViewController {

    //Outlets
    @IBOutlet weak var qestionTitleLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var optionA: RoundedButton!
    @IBOutlet weak var optionB: RoundedButton!
    @IBOutlet weak var optionC: RoundedButton!
    @IBOutlet weak var optionD: RoundedButton!
    @IBOutlet weak var optionE: RoundedButton!
    @IBOutlet weak var submitButton: RoundedButton!
    @IBOutlet var optionButtons: [RoundedButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerCountdoun: UILabel!

    //Variables
    let dataService = DataService()
    private(set) var questions = [QuestionModel]()
    private(set) var questionIndex = Int()
    private(set) var selectedAnswer: Int?
    private(set) var questionNumber: Int = 1
    let progress = Progress(totalUnitCount: 5)
    private(set) var scoreCount = 0

    private(set) var timer: Timer?
    private(set) var timeLeft = 120



    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleQuestions()
        pickQuestion()
        updateUI()
        progress.completedUnitCount += 1
        timerSetup()
    }

    fileprivate func timerSetup() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)
    }

    @objc func onTimer() {
        timeLeft -= 1
        let minutes = timeLeft / 60 % 60
        let seconds = timeLeft % 60
        if seconds >= 10 {
            timerCountdoun.text = "Time left: \(minutes):\(seconds)"
        } else {
            timerCountdoun.text = "Time left: \(minutes):0\(seconds)"
        }


        if timeLeft <= 0 {
            guard let timer = timer else {return}
            timer.invalidate()

            let alert = UIAlertController(title: "Oops!", message: "Time is gone!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Home Page", style: .default, handler: { (_) in
                self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }

        if timeLeft <= 20 {
            timerCountdoun.textColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
    }

    fileprivate func updateUI() {
        UIView.animate(withDuration: 0.5) {
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            self.scoreLabel.text = "Score: \(self.scoreCount)/5"
        }
    }

    fileprivate func shuffleQuestions() {
        self.questions = dataService.question().shuffled()
    }

    fileprivate func gameResult(at gameScore: Int) -> String {
        var result = ""
        if gameScore == 5 {
            result = "excellent"
        } else if gameScore == 4 {
            result = "good"
        } else if gameScore == 3 {
            result = "middle"
        } else {
            result = "bad"
        }
        return result
    }

    fileprivate func pickQuestion() {
        if questions.count > 0 {
            questionIndex = 0
            qestionTitleLabel.text = questions[questionIndex].questionTitle
            questionImage.image = UIImage(named: questions[questionIndex].questionImage)

            for i in 0..<optionButtons.count {
                optionButtons[i].setTitle(questions[questionIndex].answers[i], for: .normal)
            }
        } else {
            timer?.invalidate()
            let alert = UIAlertController(title: "You did it!", message: "Your result is \(gameResult(at: scoreCount))! \n You gave \(scoreCount) right answers.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Home Page", style: .default, handler: { (_) in
                self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func submitAnswerBtnWasTapped(_ sender: UIButton) {
        if selectedAnswer != nil {
            checkRightAnswer()
            questions.remove(at: questionIndex)
            pickQuestion()
            resetButtonStates()
            selectedAnswer = nil
            updateUI()
            questionNumber += 1
            progress.completedUnitCount += 1
        } else {
            submitButton.setTitle("Please, check your answer!", for: .normal)
            submitButton.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        }
    }

    fileprivate func checkRightAnswer() {
        let rightAnswer = questions[questionIndex].rightAnswer
        if rightAnswer == selectedAnswer {
            scoreCount += 1
        } else {
            print("no")
        }
    }
    var isAlreadySelected: Bool = false
    @IBAction func optionButtonWasTapped(_ sender: UIButton) {
        isAlreadySelected = sender.isSelected
        resetButtonStates()
        if !isAlreadySelected {
            sender.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
            selectedAnswer = sender.tag
        } else {
            selectedAnswer = nil
        }
    }

    fileprivate func resetButtonStates() {
        for button in optionButtons {
            button.isSelected = false
            button.backgroundColor = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)
            submitButton.setTitle("SUBMIT AND CONTINUE", for: .normal)
            submitButton.backgroundColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)
        }
    }
    @IBAction func giveUpButtonWasTapped(_ sender: UIButton) {
        timer?.invalidate()
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }




}
