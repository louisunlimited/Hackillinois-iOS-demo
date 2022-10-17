//
//  ContentViewModel.swift
//  Hackillinois iOS demo
//
//  Created by Louis Qian on 10/10/22.
//

import SwiftUI

// API JSON data scheme
struct Location : Hashable, Codable {
    let description : String
    let tags : [String]
    let latitude : Float // fewer presision but enough
    let longitude : Float
}

struct Event : Hashable, Codable, Identifiable {
    let id : String
    let name : String
    let description : String
    let startTime : Int // perhaps int64, defaults int32 may not be enough
    let endTime : Int
    let locations : [Location]
    let sponsor : String
    let eventType : String
}

struct Events :Hashable, Codable {
    let events: [Event]
}

final class ContentViewModel: ObservableObject {
    @Published var events : [Event] = []
    @Published var showDetailView = false
//    @Published var selectedID : String?
    
    func fetchData() {
        // make sure we have a url
        guard let url = URL(string: "https://api.hackillinois.org/event/") else {
            return;
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , err in
            // make sure we have data and no error
            guard let data = data, err == nil else {
                return
            }
            
            do {
                let events = try JSONDecoder().decode(Events.self, from: data)
                DispatchQueue.main.async {
                    self?.events = events.events
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
