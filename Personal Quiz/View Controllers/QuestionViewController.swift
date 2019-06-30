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
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!

    private var currentQuestion = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.layer.cornerRadius = 8.0
        nextQuestion()
    }

    private func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangeStackView.isHidden = true
    }

    private func nextQuestion() {
        updateUI()

        switch currentQuestion {
        case 0:
            singleStackView.isHidden = false
        case 1:
            multipleStackView.isHidden = false
        case 2:
            rangeStackView.isHidden = false
        default:
            performSegue(withIdentifier: "showResults", sender: nil)
        }

        currentQuestion += 1
    }

    @IBAction func resultsButtonPressed(_ sender: Any) {
        nextQuestion()
    }
}
