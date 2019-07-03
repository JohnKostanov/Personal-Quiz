//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 30/06/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var cardImage: UIImageView!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!

    var results: QuizResults?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        cardImage.layer.cornerRadius = 4.0
        moreButton.layer.cornerRadius = 4.0

        updateUI()
    }

    private func updateUI() {
        guard let results = results,
            let (title, definition) = results.calculate()
            else { return }

        titleLabel.text = title
        definitionLabel.text = definition
    }

    @IBAction func moreButtonPressed() {
        openUrl("https://www.english-language.ru/programs/general/")
    }

    private func openUrl(_ url: String) {
        if let url = URL(string: url) {
            openUrl(url)
        }
    }

    private func openUrl(_ url: URL) {
        guard UIApplication.shared.canOpenURL(url) else {
            return
        }

        UIApplication.shared.open(url)
    }
}
