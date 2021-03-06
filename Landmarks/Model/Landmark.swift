//
//  Landmark.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable{ //identifiable protocol uses id
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
  
    private var imageName: String
    
    var image: Image{
        Image(imageName)
    }
    
    //returns featured image if it exists
    var featureImage: Image? {
            isFeatured ? Image(imageName + "_feature") : nil
        }

    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
