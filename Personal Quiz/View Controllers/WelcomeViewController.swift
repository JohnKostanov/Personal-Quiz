//
//  ViewController.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 30/06/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet var cardView: UIView!
    @IBOutlet var cardImage: UIImageView!
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.layer.cornerRadius = 8.0
        cardView.layer.shadowColor = #colorLiteral(red: 0.5176470588, green: 0.3019607843, blue: 0.9019607843, alpha: 1)
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowRadius = 3.0
        cardView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)

        cardImage.layer.cornerRadius = 4.0
        startButton.layer.cornerRadius = 4.0
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
