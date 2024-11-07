//
//  TripView.swift
//  BusView
//
//  Created by Catherine Megregian on 07/11/2024.
//

import SwiftUI

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
                VStack {
                    Text("The next bus leaves at \(activeTrip.route.first!.departure.scheduled.formatted(date: .omitted, time: .shortened))")
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
