//
//  MedalsModel.swift
//  OlympicsMedalBoard
//
//  Created by Pratyusha Joginipally on 8/5/24.
//

import Foundation

struct MedalsCount: Codable {
  let medalsCount: [Medals]
}

struct Medals: Codable {
  let country: String
  let totalCount: Int
  let gold: Int
  let silver: Int
  let bronze: Int
}
