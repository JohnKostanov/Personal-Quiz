//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 30/06/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var cardView: UIView!

    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!

    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!

    var quizLogic: QuizLogic!

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.layer.cornerRadius = 8.0

        for singleButton in singleButtons {
            singleButton.layer.cornerRadius = 4.0
        }

        let dataManager = DataManager()
        quizLogic = QuizLogic(questions: dataManager.getAllQuestions())

        updateUI()
    }

    private func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true

        navigationItem.title = "Вопрос № \(quizLogic.numberOfQuestion) из \(quizLogic.questionCount)"
        questionLabel.text = quizLogic.currentQuestion?.text
        progressView.setProgress(quizLogic.questionProgress, animated: true)

        guard let currentQuestion = quizLogic.currentQuestion,
            let currentAnswers = quizLogic.currentAnswers
            else { return }

        switch currentQuestion.type {
        case .single:
            updateSingleStack(with: currentAnswers)
        case .multiple:
            updateMultipleStack(with: currentAnswers)
        case .ranged:
            updateRangedStack(with: currentAnswers)
        }
    }

    private func updateSingleStack(with answers: [Answer]) {
        singleStackView.isHidden = false

        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: [])
        }
    }

    private func updateMultipleStack(with answers: [Answer]) {
        multipleStackView.isHidden = false

        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }

    private func updateRangedStack(with answers: [Answer]) {
        rangeStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }

    private func nextQuestion() {
        if (quizLogic.nextQuestion()) {
            updateUI()
        } else {
            goToResultsVC()
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showResults" else { return }
        let destination = segue.destination as! ResultsViewController
        destination.results = quizLogic.getResults()
    }

    private func goToResultsVC() {
        performSegue(withIdentifier: "showResults", sender: nil)
    }

    // MARK: - Actions

    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let index = singleButtons.firstIndex(of: sender) else {
            return
        }

        quizLogic.chooseAnswer(at: index)
        nextQuestion()
    }

    @IBAction func rangedButtonPressed() {
        guard let currentAnswers = quizLogic.currentAnswers else {
            return
        }

        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        quizLogic.chooseAnswer(at: index)
        nextQuestion()
    }

    @IBAction func multipleButtonPressed() {
        for (index, view) in multipleStackView.arrangedSubviews.enumerated() {
            guard let stackView = view as? UIStackView else { continue }
            guard let switchView = stackView.arrangedSubviews.last as? UISwitch else { continue }

            if switchView.isOn {
                quizLogic.chooseAnswer(at: index)
            }
        }

        nextQuestion()
    }
}
