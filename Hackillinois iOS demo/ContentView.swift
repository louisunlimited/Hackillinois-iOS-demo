//
//  ContentView.swift
//  Hackillinois iOS demo
//
//  Created by Louis Qian on 10/10/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()
    @State private var selectedItem : Event? = nil
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(viewModel.events, id: \.self) {event in
                        VStack {
                            Text("Example Date")
                                .font(.caption)
                            EventCellView(eventName: event.name, description: event.description, eventType: event.eventType)
                        }
                        .onTapGesture {
                            self.selectedItem = event
                            viewModel.showDetailView.toggle()
                        }
                        .padding()
                    }
                }
                .sheet(item: self.$selectedItem, content: { event in
                    NavigationView {
                        EventDetailView(eventName: event.name, eventType: event.eventType , eventSponsor: event.sponsor, eventDescription: event.description)
                            .toolbar {
                                Button("dismiss") {
                                    // some code to make it dissapera
                                }
                            }
                            .navigationTitle(event.name)
                    }
                })
            }
            .onAppear{
                viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
