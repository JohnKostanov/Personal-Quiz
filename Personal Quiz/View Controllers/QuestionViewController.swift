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

    @IBOutlet var rangeStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!

    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleContentStackView: UIStackView!

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!

    var quizLogic: QuizLogic!

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.layer.cornerRadius = 8.0

        let dataManager = DataManager()
        quizLogic = QuizLogic(questions: dataManager.getAllQuestions())

        updateUI()
    }

    private func nextQuestion() {
        if (quizLogic.nextQuestion()) {
            updateUI()
        } else {
            goToResultsVC()
        }
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
        clearSubviews(view: singleStackView)

        for answer in answers {
            let button = makeSigleButton(title: answer.text)
            singleStackView.addArrangedSubview(button)
        }
    }

    private func updateMultipleStack(with answers: [Answer]) {
        multipleStackView.isHidden = false
        clearSubviews(view: multipleContentStackView)

        for answer in answers {
            let row = makeMultipleRow(labelText: answer.text)
            multipleContentStackView.addArrangedSubview(row)
        }
    }

    private func updateRangedStack(with answers: [Answer]) {
        rangeStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }

    private func makeSigleButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: [])
        button.setTitleColor(#colorLiteral(red: 0.5647058824, green: 0.2549019608, blue: 1, alpha: 1), for: [])
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        button.layer.cornerRadius = 4.0
        button.addTarget(self, action: #selector(singleButtonPressed(_:)), for: .touchUpInside)
        return button
    }

    private func makeMultipleRow(labelText: String) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20.0

        let label = UILabel()
        label.text = labelText
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17.0)
        label.textColor = UIColor.white
        label.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .horizontal)

        let switchView = UISwitch()
        switchView.setOn(false, animated: false)
        switchView.setContentHuggingPriority(UILayoutPriority(750), for: .horizontal)
        switchView.setContentCompressionResistancePriority(UILayoutPriority(751), for: .horizontal)

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(switchView)

        return stackView
    }

    private func clearSubviews(view: UIView) {
        view.subviews.forEach { $0.removeFromSuperview() }
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
        guard let index = singleStackView.arrangedSubviews.firstIndex(of: sender) else {
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
        for (index, view) in multipleContentStackView.arrangedSubviews.enumerated() {
            guard let stackView = view as? UIStackView else { continue }
            guard let switchView = stackView.arrangedSubviews.last as? UISwitch else { continue }

            if switchView.isOn {
                quizLogic.chooseAnswer(at: index)
            }
        }

        nextQuestion()
    }
}
