//
//  DataService.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 30/07/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Foundation
class DataService{

    private(set) var questions = [QuestionModel]()

    func question() -> [QuestionModel]{

        let questions = [
            QuestionModel(questionTitle: "What output will be produced by the code below?",
                          questionImage: "first.jpg",
                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
                          rightAnswer: 2),
            QuestionModel(questionTitle: "1",
                          questionImage: "first.jpg",
                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
                          rightAnswer: 2),
            QuestionModel(questionTitle: "2",
                          questionImage: "first.jpg",
                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
                          rightAnswer: 2),
            QuestionModel(questionTitle: "3",
                          questionImage: "first.jpg",
                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
                          rightAnswer: 2)
        ]

        return questions
    }


}
