//
//  MainViewController.swift
//  Demo
//
//  Created by Davide Castello on 12/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit
import EXTView

class MainViewController: UIViewController {

  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var proceedButton: EXTButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Date
    dateLabel.setupWithFontSize(Constants.TEXT_SIZE_16, Constants.grey)
    dateLabel.text = Date().toSimpleString()
    // Title
    titleLabel.setupWithFontSize(Constants.TEXT_SIZE_24, Constants.customBlack)
    // Proceed
    proceedButton.setupMainButtons()
  }


}

