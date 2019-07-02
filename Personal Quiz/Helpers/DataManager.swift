//
//  DataManager.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 02/07/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

class DataManager {
    func getAllQuestions() -> [Question] {
        return [
            Question(text: "Question 1", type: .single, answers: [
                Answer(text: "answer 1", type: .type1),
                Answer(text: "answer 2", type: .type2),
                Answer(text: "answer 3", type: .type3),
                Answer(text: "answer 4", type: .type4)
            ]),
            Question(text: "Question 2", type: .multiple, answers: [
                Answer(text: "answer 1", type: .type1),
                Answer(text: "answer 2", type: .type2),
                Answer(text: "answer 3", type: .type3),
                Answer(text: "answer 4", type: .type4)
            ]),
            Question(text: "Question 3", type: .ranged, answers: [
                Answer(text: "answer 1", type: .type1),
                Answer(text: "answer 2", type: .type2),
                Answer(text: "answer 3", type: .type3),
                Answer(text: "answer 4", type: .type4)
            ]),
        ]
    }
}
