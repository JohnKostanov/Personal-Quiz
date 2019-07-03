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
            Question(text: "C какой целью хотите выучить английский?", type: .single, answers: [
                Answer(text: "Для работы", type: .level2),
                Answer(text: "Для школы / университета", type: .level1),
                Answer(text: "Для путешествий", type: .level3),
                Answer(text: "Для деловых переговоров", type: .level4)
            ]),
            Question(text: "Какой ваш текущий уровень знания?", type: .single, answers: [
                Answer(text: "Beginner", type: .level1),
                Answer(text: "Elementary", type: .level2),
                Answer(text: "Pre-Intermediate", type: .level3),
                Answer(text: "Не знаю", type: .level1)
            ]),
            Question(text: "Каким навыком хотите овладеть прежде всего?", type: .multiple, answers: [
                Answer(text: "Научится разговаривать", type: .level1),
                Answer(text: "Научится грамотно писать", type: .level2),
                Answer(text: "Понимать речь и письменный текст", type: .level3),
                Answer(text: "Избавиться от акцента", type: .level4)
            ]),
            Question(text: "Вам интересно живое общение с носителем языка?", type: .single, answers: [
                Answer(text: "да", type: .level3),
                Answer(text: "нет", type: .level1)
            ]),
            Question(text: "Сколько времени вы готовы посвятить изучению?", type: .single, answers: [
                Answer(text: "Каждый день по 30 минут", type: .level4),
                Answer(text: "3 занятия в неделю", type: .level2),
                Answer(text: "2 занятия в неделю", type: .level1)
            ]),
            Question(text: "Сколько денег вы готовы потратить на обучение?", type: .ranged, answers: [
                Answer(text: "5000", type: .level1),
                Answer(text: "10000", type: .level2),
                Answer(text: "15000", type: .level3),
                Answer(text: "20000", type: .level4)
            ])
        ]
    }
}
