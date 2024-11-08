//
//  ContentView.swift
//  BusView
//
//  Created by Rob Wilson on 06/11/2024.
//

import SwiftUI

struct DebugView: View {
    var service = RouteService()
    @State var quotesStatus = "Processing quotes..."
    @State var tripStatus = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(quotesStatus)
                .padding(.vertical, 20)
            Text(tripStatus)
                .padding(.vertical, 20)
        }
        .padding()
        .task {
            do {
                let response = try await service.getQuotes()
                quotesStatus = "Quotes result success!"
                let tripId = response.quotes.last!.legs.first!.tripUid
                tripStatus = "Processing trip..."
                do {
                    let _ = try await service.getTrip(id: tripId)
                    tripStatus = "Trip result success!"
                } catch {
                    tripStatus = error.localizedDescription
                }
            } catch {
                quotesStatus = error.localizedDescription
            }
        }
    }
}

#Preview {
    DebugView()
}
