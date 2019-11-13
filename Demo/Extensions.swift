//
//  Extensions.swift
//  Assibro
//
//  Created by Davide Castello on 24/09/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import Foundation
import Kingfisher
import EXTView

// MARK: Extensions

extension String {
  
  var localized: String {
    return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
  }
  
  static func nonNull(_ string: String?) -> String {
    return (string != nil) ? string! : ""
  }
  
  func indexOf(target: String) -> Int? {
    return (self as NSString).range(of: target).location
  }
  
  func contains(s: String) -> Bool {
    return (self.range(of: s) != nil) ? true : false
  }
  
  func validEmail() -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
  
  func capitalizingFirstLetter() -> String {
    return prefix(1).capitalized + dropFirst()
  }
}

extension Date {
  
  func toSimpleString() -> String {
    return self.toString(dateFormat: Constants.SIMPLE_DATE_FORMAT, Locale.current.identifier)
  }
  
  func toString(dateFormat format: String, _ locale: String? = nil) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if(locale != nil) {
      dateFormatter.locale = Locale(identifier: locale!)
    }
    return dateFormatter.string(from: self)
  }
  
  static func fromString(_ dateAsString: String, dateFormat format: String, UTC: Bool = true) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    if UTC {
      dateFormatter.timeZone = TimeZone.init(identifier: "UTC")
    }
    return dateFormatter.date(from: dateAsString)
  }
  
  static func nonNullableDateFromString(_ dateAsString: String, dateFormat format: String, UTC: Bool = true) -> Date {
    let date = Date.fromString(dateAsString, dateFormat: format, UTC: UTC)
    return (date != nil) ? date! : Date()
  }
  
  func dateByAdding(days: Int) -> Date {
    let c = Calendar.current
    return c.date(byAdding: DateComponents(calendar: c, day: days), to: self) ?? self
  }
  
  func dateByAdding(minutes: Int) -> Date {
    let c = Calendar.current
    return c.date(byAdding: DateComponents(calendar: c, minute: minutes), to: self) ?? self
  }
  
  func dateByAdding(seconds: Int) -> Date {
    let c = Calendar.current
    return c.date(byAdding: DateComponents(calendar: c, second: seconds), to: self) ?? self
  }
}

// MARK: Extensions - UI Elements

extension UILabel {
  
  func setAppFont(big: Bool = false) {
    self.font = UIFont.appFont(big: big)
  }
  
  func underline() {
    guard let text = self.text else { return }
    underline(0, text.count)
  }
  
  func underlineFromCharacter(char: String, offset: Int) {
    guard let text = self.text else { return }
    var index = 0
    if (text.contains(s: char)) {
      guard let charIndex = text.indexOf(target: char) else { return }
      index = charIndex
    }
    let indexWithOffset = index + 1 + offset
    // check to avoid going out of bounds
    if indexWithOffset < text.count {
      index = indexWithOffset
    }
    underline(index, text.count)
  }
  
  private func underline(_ position: Int, _ length: Int) {
    let textRange = NSMakeRange(position, length - position)
    let attributedText = NSMutableAttributedString(string: text!)
    attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
    self.attributedText = attributedText
  }
  
  func setup(_ big: Bool = false, _ textColor: UIColor = Constants.primaryTextColor) {
    self.setAppFont(big: big)
    self.textColor = textColor
  }
  
  func setupWithFontSize(_ fontSize: CGFloat = Constants.TEXT_SIZE_14, _ textColor: UIColor = Constants.primaryTextColor) {
    self.font = UIFont.appFont(fontSize: fontSize)
    self.textColor = textColor
  }
  
  func setLineHeight(_ lineHeight: CGFloat) {
    if let currentText = self.text {
      let attributedString = NSMutableAttributedString(string: currentText)
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.lineSpacing = lineHeight
      paragraphStyle.alignment = self.textAlignment
      attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
      self.attributedText = attributedString
    }
  }
}

extension UITextView {
  
  func setAppFont(big: Bool = false) {
    self.font = UIFont.appFont(big: big)
  }
  
  func setup() {
    self.setAppFont()
    self.textColor = Constants.primaryTextColor
    self.tintColor = Constants.primaryTextColor
  }
  
  func nonEmptyText() -> String? {
    return self.text.isEmpty ? nil : self.text.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

extension UITextField {
  func setAppFont(big: Bool = false) {
    self.font = UIFont.appFont(big: big)
  }
  
  func setupWithFontSize(_ fontSize: CGFloat = Constants.TEXT_SIZE_14, _ textColor: UIColor = Constants.primaryTextColor, _ placeholderColor: UIColor = Constants.lightTextColor) {
    self.font = UIFont.appFont(fontSize: fontSize)
    self.textColor = textColor
    self.tintColor = textColor
    self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
  }
  
  func setup() {
    self.setAppFont()
    self.textColor = Constants.primaryTextColor
    self.tintColor = Constants.primaryTextColor
    self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: Constants.lightTextColor])
  }
  
  func setup(big: Bool, textColor: UIColor = Constants.primaryTextColor, _ placeholderColor: UIColor = Constants.lightTextColor) {
    self.setAppFont(big: big)
    self.textColor = textColor
    self.tintColor = textColor
    self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
  }
  
  func hideKeyboard() {
    if self.isFirstResponder {
      self.resignFirstResponder()
    }
  }
  
  func nonEmptyText() -> String? {
    guard let nonNullFirstName = self.text else { return nil }
    return nonNullFirstName.isEmpty ? nil : nonNullFirstName.trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  func switchShowPassword() {
    self.isSecureTextEntry = !self.isSecureTextEntry
  }
}

extension UIButton {
  
  func setAppFont(big: Bool = false) {
    self.titleLabel?.setAppFont(big: big)
  }
  
}

extension UIView {
  
  func dropShadow() {
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
    layer.shadowRadius = 3.0
    layer.shadowOpacity = 0.5
  }
}

extension EXTView {
  
  func setupFieldContainer(_ borderColor: UIColor = Constants.greyLight) {
    self.backgroundColor = Constants.white
    self.borderColor = borderColor
    self.borderWidth = 1
    self.cornerRadius = 2
  }
}

extension EXTButton {
  
  func setupSecondaryButtons() {
    setupBigButton(backgroundColor: Constants.background, textColor: Constants.greyBlack)
    self.borderWidth = 1
    self.borderColor = Constants.greyDarker
  }
  
  func setupMainButtons() {
    setupBigButton(backgroundColor: Constants.colorAccent, textColor: Constants.white)
  }
  
  private func setupBigButton(backgroundColor: UIColor, textColor: UIColor) {
    self.titleLabel?.font = UIFont.appFont(fontSize: Constants.TEXT_SIZE_16)
    self.tintColor = textColor
    self.setTitleColor(textColor, for: UIControl.State.normal)
    self.backgroundColor = backgroundColor
    self.cornerRadius = 4
  }
  
  func enable(_ enabled: Bool) {
    self.isUserInteractionEnabled = enabled
    self.alpha = (enabled) ? 1.0 : 0.3
  }
}

extension UIImageView {
  
  func setupIcon() {
    self.image = self.image?.withRenderingMode(.alwaysTemplate)
    self.tintColor = Constants.appIconsColor
  }
  
  func changeColor(_ color: UIColor) {
    self.image = self.image?.withRenderingMode(.alwaysTemplate)
    self.tintColor = color
  }
  
  func loadImage(url: URL) {
    self.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
  }
  
  func loadAvatar(url: URL) {
    let size = self.frame.size
    let cornerRadius = size.width / 2
    
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = true
    
    let processor = ResizingImageProcessor(referenceSize: size, mode: .aspectFill) >> CroppingImageProcessor(size: size)
    self.kf.setImage(
      with: url,
      options: [
        .waitForCache,
        .processor(processor),
        .scaleFactor(UIScreen.main.scale),
        .transition(.fade(1)),
        .cacheOriginalImage
      ])
  }
  
  func toCircle() {
    let size = self.frame.size
    let cornerRadius = size.width / 2
    
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = true
  }
}

extension UIFont {
  static func appFont(big: Bool = false) -> UIFont {
    let size = (big) ? Constants.TEXT_SIZE_24 : Constants.TEXT_SIZE_14
    return appFont(fontSize: size)
  }
  
  static func appFont(fontSize: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize)
  }
  
  static func appFont(name: String, fontSize: CGFloat) -> UIFont {
    return UIFont.init(name: name, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
  }
}

extension UIViewController {
  var appDelegate: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  var className: String {
    return NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
  }
  
  func show(_ vc: UIViewController) {
    self.present(vc, animated: true, completion: nil)
  }
}
