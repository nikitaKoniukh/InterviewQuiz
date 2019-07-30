//
//  DataService.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 30/07/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Foundation
class DataService{

    static var instance = DataService()

    func getQuestion() -> [QuestionModel] {
        var questions = [QuestionModel]()
        questions.append(QuestionModel(
            questionTitle: "What output will be produced by the code below?",
            questionImage: "first.jpg",
            answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
            rightAnswer: 2
        ))

        return questions
    }
}
