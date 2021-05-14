//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Alicia Windsor on 15/05/2021.
//

import SwiftUI

struct FavoriteButton: View {
    
    @Binding var isSet: Bool //binding - changes made in this view propagate back to dataset
    
    var body: some View {
        Button(action: {
            isSet.toggle()
    
        }){
            Image(systemName: isSet ? "star.fill" : "star")
                            .foregroundColor(isSet ? Color.yellow : Color.gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
