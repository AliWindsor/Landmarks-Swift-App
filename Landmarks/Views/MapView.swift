//
//  MapView.swift
//  Landmarks
//
//  Created by Alicia Windsor on 13/05/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //state estabishes a source of truth for data in the app, that can modify multiple views
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)//$ allows us to pass a binding/reference to the underlying value
            .onAppear{
                setRegion(coordinate)
            }
        //when user interacts with map, map updates region to match part of map that is visible in the UI
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
