//
//  EventDetailView.swift
//  Hackillinois iOS demo
//
//  Created by Louis Qian on 10/10/22.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    @StateObject var viewMode = EventDetailViewModel()
    var eventName : String
    var eventType : String
    var eventSponsor : String
    var eventDescription : String
    //    var location : Double?  // might not have location
    
    var body: some View {
    
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                VStack (alignment: .leading) {
                    Text(eventType)
                        .font(.caption)
                    Text(eventSponsor)
                        .font(.caption)
                    Text(eventDescription)
                    Divider()
                    Text("Locations")
                        .font(.subheadline)
                    Map(coordinateRegion: $viewMode.reigon, annotationItems: viewMode.locations){ location in
                        MapMarker(coordinate : location.coordinates)
                    }
                    Spacer()
                }
                .padding()

            
        }
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventName: "Example Name", eventType: "Q&A", eventSponsor: "Hackillinois", eventDescription: "This is a sample discription")
    }
}
