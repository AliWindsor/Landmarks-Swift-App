//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Alicia Windsor on 14/05/2021.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        ScrollView {
                  MapView(coordinate: landmark.locationCoordinate)
                      .ignoresSafeArea(edges: .top)
                      .frame(height: 300)

                  CircleImage(image: landmark.image)
                      .offset(y: -130)
                      .padding(.bottom, -130)

                  VStack(alignment: .leading) {
                      HStack{
                          Text(landmark.name)
                              .font(.title)
                              .foregroundColor(.primary)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                      }
                      HStack {
                          Text(landmark.park)
                          Spacer()
                          Text(landmark.state)
                      }
                      .font(.subheadline)
                      .foregroundColor(.secondary)

                      Divider()

                      Text("About \(landmark.name)")
                          .font(.title2)
                      Text(landmark.description)
                  }
                  .padding()

                  //Spacer() //push content to top of screen
        }
        .navigationTitle(landmark.name) //title for detail view
        .navigationBarTitleDisplayMode(.inline) //show title in line
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
