//
//  Constants.swift
//  Assibro
//
//  Created by Davide Castello on 24/09/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit

class Constants {
  
  // DateTime Formats
  static let SIMPLE_DATE_FORMAT = "dd/MM/yyyy"
  static let NETWORK_DATETIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss'Z'"
  static let TIME_FORMAT = "HH:mm"
  
  // Intervals & Animations
  static let DEFAULT_ANIMATION_DURATION = 200
  static let DEFAULT_ANIMATION_DURATION_SECONDS = 0.2
  
  // MARK: Dimensions
  static let TEXT_SIZE_24: CGFloat = 24
  static let TEXT_SIZE_22: CGFloat = 22
  static let TEXT_SIZE_20: CGFloat = 20
  static let TEXT_SIZE_18: CGFloat = 18
  static let TEXT_SIZE_16: CGFloat = 16
  static let TEXT_SIZE_14: CGFloat = 14
  static let TEXT_SIZE_12: CGFloat = 12
  
  // MARK: Colors
  static let colorPrimary = blue
  static let primaryTextColor = grey
  static let lightTextColor = greyLight
  static let appBackgroundColor = background
  static let colorAccent = yellow
  static let colorAccentDark = yellow
  
  static let appIconsColor = white
  static let appIconsColorSelected = yellow
  static let menuLabelsColor = white
  static let menuLabelsColorSelected = yellow
  static let headerBackgroundColor = blue
  static let appBackgroundColorForWhiteText = blue
  
  static let blue = UIColor.init(red:0.08, green:0.29, blue:0.54, alpha:1.0)
  static let blueLight = UIColor.init(red:0.34, green:0.61, blue:0.84, alpha:1.0)
  static let grey = UIColor.init(red: 0.31, green: 0.38, blue: 0.43, alpha: 1)
  static let greyDark = UIColor.init(red: 0.6, green: 0.65, blue: 0.7, alpha: 1)
  static let greyDarker = UIColor.init(red:0.80, green:0.82, blue:0.85, alpha:1.0)
  static let greyBlack = UIColor.init(red:0.37, green:0.43, blue:0.49, alpha: 1)
  static let greyLight = UIColor.init(red: 0.89, green: 0.91, blue: 0.92, alpha: 1)
  static let background = UIColor.init(red: 245.0/255.0, green: 247.0/255.0, blue: 250.0/255.0, alpha: 1)
  static let yellow = UIColor.init(red:0.97, green:0.75, blue:0.09, alpha:1.0)
  static let yellowDark = UIColor.init(red:0.86, green:0.62, blue:0.02, alpha:1.0)
  static let greenLight = UIColor.init(red:0.89, green:0.98, blue:0.90, alpha:1.0)
  static let greenDark = UIColor.init(red:0.05, green:0.47, blue:0.09, alpha:1.0)
  static let red = UIColor.init(red:0.88, green:0.18, blue:0.22, alpha:1.0)
  static let customBlack = UIColor.init(red:0.12, green:0.16, blue:0.20, alpha:1.0)
  static let black = UIColor.black
  static let white = UIColor.white
  static let clear = UIColor.clear
  
  // Demo
  static let sampleImageURL: URL = URL(string:  "https://a0.muscache.com/im/pictures/ac9e3d82-e064-4111-bd88-e9abb697ef1f.jpg?aki_policy=xx_large")!
  static let sampleHighlight = "Un trionfo di bellezza"
  static let sampleDescription = """
Benvenuti nella stanza più antica del palazzo: la Royal Suite.
Gli affreschi sul soffitto all’ingresso risalgono al 1600, mentre le antiche piastrelle dipinte del pavimento sono in autentica Maiolica di Napoli, ad opera di Ignazio Chiaiese.
"""
  static let sampleReservationText = "Molto richiesta in questo periodo!"
}
