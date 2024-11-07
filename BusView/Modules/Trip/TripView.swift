//
//  TripView.swift
//  BusView
//
//  Created by Catherine Megregian on 07/11/2024.
//

import SwiftUI
import MapKit

struct TripView: View {
    @EnvironmentObject var viewModel: TripViewModel
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
            case .error(let error):
                Text("\(error): \(error.localizedDescription)")
            case .loaded(let activeTrip):
                Map {
                    ForEach(activeTrip.route) { stop in
                        Marker(
                            "\(stop.location.name)",
                            systemImage: "signpost.left.fill",
                            coordinate: CLLocationCoordinate2D(latitude: stop.location.lat, longitude: stop.location.lon))
                    }
                }
            }
        }
        .navigationTitle("Trip View")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.onViewAppear()
        }
    }
}

#Preview {
    TripView()
        .environmentObject(TripViewModel(routeService: RouteService()))
}
