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

    static func getResult(for levelType: LevelType) -> ResultDefinition {
        switch levelType {
        case .level1:
            return ResultDefinition(
                title: "Бесплатное тестирование уровня языка",
                definition: "Отличная возможность оценить уровень владения языком в онлайн-формате. Тестирование проводит методист школы: он поможет оценить ваш уровень владения английским и отдельных навыков, таких как произношение, аудирование, знание грамматики. Методист также составит для вас персональные рекомендации по эффективному обучению английскому языку."
            )
        case .level2:
            return ResultDefinition(
                title: "Бесплатное пробное занятие",
                definition: "Изучение английского языка в школе начинается с бесплатного вводного урока. После него мы по математическим алгоритмам подбираем для вас подходящую группу. Во время обучения английскому языку, кроме посещения регулярных уроков, вы делаете домашние задания, а по окончании курса из 40 занятий получаете диплом."
            )
        case .level3:
            return ResultDefinition(
                title: "Встреча с носителями языка",
                definition: "Наша цель – усовершенствовать Ваши навыки общения на английском языке. А для начинающих - научить Вас говорить на английском языке без акцента за короткий срок. Беседа с Вами будет приносить носителю одно лишь удовольствие. Вы будете встречаться с настоящими носителями языка. Это Британские студенты, обучающиеся в магистратуре в лучших университетах Москвы."
            )
        case .level4:
            return ResultDefinition(
                title: "Скидка 30% на онлайн-курс английского",
                definition: "Занятия проходят по коммуникативной методике. Вы начинаете говорить на первом же уроке и говорите больше половины занятия. Курсы основаны на британских материалах, и вы наглядно видите свое продвижение к следующему уровню в личном кабинете."
            )
        }
    }
}
