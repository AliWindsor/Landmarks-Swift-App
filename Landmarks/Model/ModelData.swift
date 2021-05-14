//
//  ModelData.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import Foundation
//load function that fetches JSON data witha given name from the main bundle, local method relies on return type conformance to the codable protocol

var landmarks: [Landmark] = load("landmarkData.json") //create an array of landmarks and initialize from landmarkData.json

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
      else {
          fatalError("Couldn't find \(filename) in main bundle.")
      }

      do {
          data = try Data(contentsOf: file)
      } catch {
          fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
      }

      do {
          let decoder = JSONDecoder()
          return try decoder.decode(T.self, from: data)
      } catch {
          fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
      }
}
