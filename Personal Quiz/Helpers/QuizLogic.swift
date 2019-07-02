//
//  QuizLogic.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 02/07/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

class QuizLogic {
    private let questions: [Question]
    private var questionIndex = 0
    private var chosenAnswers: [Answer] = []

    init(questions: [Question]) {
        self.questions = questions
    }

    var questionCount: Int {
        return questions.count
    }

    var currentQuestion: Question? {
        return questions.isEmpty ? nil : questions[questionIndex]
    }

    var currentAnswers: [Answer]? {
        return currentQuestion?.answers
    }

    var questionProgress: Float {
        return questions.isEmpty ? 0 : Float(numberOfQuestion) / Float(questionCount)
    }

    var numberOfQuestion: Int {
        return questionIndex + 1
    }

    var hasNextQuestion: Bool {
        return questionIndex + 1 < questionCount
    }

    func nextQuestion() -> Bool {
        if (hasNextQuestion) {
            questionIndex += 1
            return true
        }

        return false
    }
    
    func chooseAnswer(at index: Int) {
        guard let currentAnswers = currentAnswers else {
            return
        }

        if (index >= 0 && index < currentAnswers.count) {
            chosenAnswers.append(currentAnswers[index])
        }
    }

    func getResults() -> QuizResults {
        return QuizResults(with: chosenAnswers)
    }
}
