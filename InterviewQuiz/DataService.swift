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
            QuestionModel(questionTitle: "When this code finishes executing, how many strings will the cities array contain?",
                          questionImage: "1.png",
                          answers: ["0","1","3","Compile but crash","Will not compile"],
                          rightAnswer: 5),
            QuestionModel(questionTitle: "What output will be produced by the code below?",
                          questionImage: "2.png",
                          answers: ["Vehicle","BMW","nil","Compile but crash","Will not compile"],
                          rightAnswer: 5),
            QuestionModel(questionTitle: "When this code is executed, what will be the value of the 'b' constant?",
                          questionImage: "3.png",
                          answers: ["'5' (a string)","'55' (a string)","5, 5 (an array of integers)","55 (an integer)","Will not compile"],
                          rightAnswer: 2),
            QuestionModel(questionTitle: "What output will be produced by the code below?",
                          questionImage: "4.png",
                          answers: ["128","64","This is an infinite loop","Nothing will be output","Will not compile"],
                          rightAnswer: 1),
            QuestionModel(questionTitle: "What output will be produced by the code below?",
                          questionImage: "5.png",
                          answers: ["2, 4, 8, 16, 32, 64","2, 4, 8, 16, 32, 64, 128","4, 8, 16, 32, 64","Compile but crash","Will not compile"],
                          rightAnswer: 3)
//            ,
//            QuestionModel(questionTitle: "5",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "6",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "7",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "8",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "9",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "10",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "11",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "12",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "13",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "14",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2),
//            QuestionModel(questionTitle: "15",
//                          questionImage: "first.jpg",
//                          answers: ["This is a subset","This is not a subset","Nothing will be output","This code will compile but crash","This code will not compile"],
//                          rightAnswer: 2)

        ]

        return questions
    }


}
