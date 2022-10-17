//
//  EventDetailViewModel.swift
//  Hackillinois iOS demo
//
//  Created by Louis Qian on 10/10/22.
//

import SwiftUI
import MapKit

struct Locations : Identifiable {
    let id = UUID()
    let name : String
    let coordinates : CLLocationCoordinate2D
}

final class EventDetailViewModel : ObservableObject {
    @Published var reigon = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.110558, longitude: -88.228333), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @Published var locations = [
        Locations(name: "place 1", coordinates: CLLocationCoordinate2D(latitude: 40.110560, longitude: -88.228400))
    ]
}
