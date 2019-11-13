//
//  ResultViewController.swift
//  Demo
//
//  Created by Davide Castello on 13/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit
import EXTView

class ResultViewController: UIViewController {
  
  @IBOutlet weak var image: UIImageView!
  @IBOutlet weak var highlightLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var reservationsLabel: UILabel!
  @IBOutlet weak var reserveButton: EXTButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Title
    self.title = "Royal Suite"
    // Image
    image.loadImage(url: Constants.sampleImageURL)
    // Highlight
    highlightLabel.setupWithFontSize(Constants.TEXT_SIZE_24, Constants.customBlack)
    highlightLabel.text = Constants.sampleHighlight
    // Description
    descriptionLabel.setupWithFontSize(Constants.TEXT_SIZE_18, Constants.customBlack)
    descriptionLabel.text = Constants.sampleDescription
    // Reservation
    reservationsLabel.setupWithFontSize(Constants.TEXT_SIZE_12, Constants.red)
    reservationsLabel.text = Constants.sampleReservationText
    // Reserve Button
    reserveButton.setupMainButtons()
  }
  
}
