//
//  ContentService.swift
//  OlympicsMedalBoard
//
//  Created by Pratyusha Joginipally on 8/5/24.
//

import Foundation

class ContentService {
  static let shared = ContentService()

  var fileURL: URL {
      let path = Bundle.main.path(forResource: "Response", ofType: "json")!
      return URL(fileURLWithPath: path)
  }

  func networkTask(completionHandler: @escaping (Data) -> Void) {
    let data = try! Data(contentsOf: fileURL)
    completionHandler(data)
  }

  func getMedalData(_ completionHandler: @escaping (MedalsCount) -> Void) {
    networkTask { data in
      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let medalData = try decoder.decode(MedalsCount.self, from: data)
        completionHandler(medalData)
      } catch {
        print("Error decoding: ", error)
      }
    }
  }
}
