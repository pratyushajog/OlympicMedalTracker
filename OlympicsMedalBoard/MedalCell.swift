//
//  MedalCell.swift
//  OlympicsMedalBoard
//
//  Created by Pratyusha Joginipally on 8/5/24.
//

import UIKit

class MedalCell: UITableViewCell {
  static let reuseId = "MedalCell"

  var titleLabel = UILabel()
  var goldMedal = CircularTextField()
  var silverMedal = CircularTextField()
  var bronzeMedal = CircularTextField()
  var totalCount = UITextField()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupCell(_ medalInfo: Medals) {
    layer.cornerRadius = 8

    titleLabel.text = medalInfo.country
    titleLabel.font = .systemFont(ofSize: 12)

    goldMedal.setup("\(medalInfo.gold)", .systemYellow)
    silverMedal.setup("\(medalInfo.silver)", .systemGray)
    bronzeMedal.setup("\(medalInfo.bronze)", .systemBrown)

    totalCount.text = "\(medalInfo.totalCount)"
    totalCount.layer.cornerRadius = 10
    totalCount.layer.borderWidth = 2
    totalCount.layer.borderColor = UIColor.white.cgColor

    totalCount.textColor = .label
    totalCount.tintColor = .label
    totalCount.textAlignment = .center
    totalCount.font = UIFont.preferredFont(forTextStyle: .body)
    totalCount.adjustsFontSizeToFitWidth = true
    totalCount.minimumFontSize = 12
    totalCount.backgroundColor = .systemBackground
  }

  func setupConstraints() {
    addSubview(titleLabel)

    let stackView = UIStackView(arrangedSubviews: [goldMedal, silverMedal, bronzeMedal, totalCount])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 8
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      goldMedal.widthAnchor.constraint(equalToConstant: 20),
      goldMedal.heightAnchor.constraint(equalToConstant: 20),
      silverMedal.widthAnchor.constraint(equalToConstant: 20),
      silverMedal.heightAnchor.constraint(equalToConstant: 20),
      bronzeMedal.widthAnchor.constraint(equalToConstant: 20),
      bronzeMedal.heightAnchor.constraint(equalToConstant: 20),
      totalCount.widthAnchor.constraint(equalToConstant: 20),
      totalCount.heightAnchor.constraint(equalToConstant: 20),

      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
      titleLabel.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),

      stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
    ])
  }
}
