//
//  ViewController.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 29/07/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var qestionTitleLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!

    //Variables
    var questions = DataService.instance.getQuestion()

    override func viewDidLoad() {
        super.viewDidLoad()

        for q in questions {
            questionImage.image = UIImage(named: q.questionImage) 
        }
    }
}








