//
//  LandingView.swift
//  BusView
//
//  Created by Catherine Megregian on 07/11/2024.
//

import SwiftUI

enum NavigationDestination: Hashable {
    case tripView
}

struct LandingView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(value: NavigationDestination.tripView) {
                    Text("Next bus from Dundee to Edinburgh")
                }
            }
            .navigationTitle("Ember")
            .navigationDestination(for: NavigationDestination.self) { _ in
                TripView()
                    .environmentObject(
                        TripViewModel(routeService: RouteService())
                    )
            }
        }
        .tint(.emberDark)
    }
}

#Preview {
    LandingView()
}
