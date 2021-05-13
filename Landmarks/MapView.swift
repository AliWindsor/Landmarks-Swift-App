//
//  MapView.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    //state estabishes a source of truth for data in the app, that can modify multiple views
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    var body: some View {
        Map(coordinateRegion: $region)//$ allows us to pass a binding/reference to the underlying value
        //when user interacts with map, map updates region to match part of map that is visible in the UI
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
