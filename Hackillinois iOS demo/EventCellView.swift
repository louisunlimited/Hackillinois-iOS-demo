//
//  EventCellView.swift
//  Hackillinois iOS demo
//
//  Created by Louis Qian on 10/10/22.
//

import SwiftUI

struct EventCellView: View {
    var eventName : String
    var description : String
    var eventType : String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0.8) {
            Spacer()
            Text(eventName)
                .font(.headline.weight(.bold))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 15.0)
            Spacer()
            Text(eventType)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .padding(.horizontal, 15.0)
            
            Text(description)
                .font(.body)
                .lineLimit(2)
                .minimumScaleFactor(0.75)
                .padding(.horizontal, 15.0)
            Spacer()
        }
        .frame(width: 325, height: 145, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
    }
}

struct EventCellView_Previews: PreviewProvider {
    static var previews: some View {
        EventCellView(eventName: "Example name", description: "This is  an example desciprtion, it's supposed to be long", eventType: "Q&A")
    }
}
