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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        cardImage.layer.cornerRadius = 4.0
        moreButton.layer.cornerRadius = 4.0
    }
}
