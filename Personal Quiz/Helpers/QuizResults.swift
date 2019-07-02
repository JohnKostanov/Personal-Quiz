//
//  QuizResults.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 02/07/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

class QuizResults {
    private let responses: [Answer]

    init(with responses: [Answer]) {
        self.responses = responses
    }

    func calculate() -> (title: String, definition: String)? {
        if (responses.isEmpty) {
            return nil
        }

        let answerTypes = responses.map { $0.type }
        var answerCount = [AnswerType: Int]()

        answerTypes.forEach { answerType in
            answerCount[answerType] = (answerCount[answerType] ?? 0) + 1
        }

        let sortedCount = answerCount.sorted { $0.value > $1.value }
        let title = sortedCount.first!.key.title
        let definition = sortedCount.first!.key.definition

        return (title, definition)
    }
}
