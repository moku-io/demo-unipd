//
//  SampleTableViewCell.swift
//  Demo
//
//  Created by Davide Castello on 13/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit
import EXTView

class SampleTableViewCell: UITableViewCell {
  
  @IBOutlet weak var containerView: EXTView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var bookmarkIcon: UIImageView!
  @IBOutlet weak var containerViewTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var containerViewBottomConstraint: NSLayoutConstraint!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func setupWithAvailability(_ availability: Availability) {
    
    // Date
    dateLabel.setupWithFontSize(Constants.TEXT_SIZE_16, Constants.customBlack)
    dateLabel.text = availability.date.toSimpleString()
    
    // Bookmark Icon
    bookmarkIcon.changeColor(Constants.customBlack)
    
    // Card
    self.containerView.cornerRadius = self.containerView.frame.size.height / 10
    self.containerView.dropShadow()
  }
  
}
