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

        let levelTypes = responses.map { $0.type }
        var levelCount = [LevelType: Int]()

        levelTypes.forEach { levelType in
            levelCount[levelType] = (levelCount[levelType] ?? 0) + 1
        }

        let sortedCount = levelCount.sorted { $0.value > $1.value }
        let result = DataManager.getResult(for: sortedCount.first!.key)

        return (result.title, result.definition)
    }
}
