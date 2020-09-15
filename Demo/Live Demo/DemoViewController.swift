//
//  DemoViewController.swift
//  Demo
//
//  Created by Davide Castello on 14/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit
import EXTView

class DemoViewController: UIViewController {
  
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var highlight: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var reservationLabel: UILabel!
  @IBOutlet weak var reserveButton: EXTButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Royal Suite"
    image.loadImage(url: Constants.sampleImageURL)
    highlight.setupWithFontSize(Constants.TEXT_SIZE_24, Constants.customBlack)
    highlight.text = Constants.sampleHighlight
    descriptionLabel.setupWithFontSize(Constants.TEXT_SIZE_18, Constants.customBlack)
    descriptionLabel.text = Constants.sampleDescription
    reservationLabel.setupWithFontSize(Constants.TEXT_SIZE_12, Constants.red)
    reservationLabel.text = Constants.sampleReservationText
    reserveButton.setupMainButtons()
  }
  
}
