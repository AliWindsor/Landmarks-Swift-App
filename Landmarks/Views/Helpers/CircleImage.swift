//
//  CircleImage.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle()) //circle mask
            .overlay(Circle().stroke(Color.white, lineWidth: 4)) //adds a gray border around the circle
            .shadow(radius: 7)
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
