//
//  CircularTextView.swift
//  OlympicsMedalBoard
//
//  Created by Pratyusha Joginipally on 8/8/24.
//

import UIKit

class CircularTextField: UITextField {

  var bColor = UIColor()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup(_ text: String, _ bColor: UIColor) {
    self.text = text
    backgroundColor = bColor
  }

  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false

    layer.cornerRadius = 10
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemGray4.cgColor

    textColor = .label
    tintColor = .label
    textAlignment = .center
    font = UIFont.preferredFont(forTextStyle: .body)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 9

    autocorrectionType = .no
    returnKeyType = .go
    placeholder = "0"
  }
}
