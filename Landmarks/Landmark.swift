//
//  Landmark.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable{
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
  
    private var imageName: String
    
    var image: Image{
        Image(imageName)
    }

    private var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
