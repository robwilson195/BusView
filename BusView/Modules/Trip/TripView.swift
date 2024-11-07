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
    @State private var selectedStop: Stop?
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
                    .scaleEffect(3)
            case .error(let error):
                Text("\(error): \(error.localizedDescription)")
            case .loaded(let activeTrip):
                Map(interactionModes: [.pitch, .pan, .zoom], selection: $selectedStop) {
                    ForEach(activeTrip.route) { stop in
                        Marker(
                            "\(stop.location.name)",
                            systemImage: "signpost.left.fill",
                            coordinate: CLLocationCoordinate2D(latitude: stop.location.lat, longitude: stop.location.lon))
                        .tag(stop)
                    }
                    if let vehicleGps = activeTrip.vehicle.gps {
                        Annotation("Bus", coordinate: CLLocationCoordinate2D(latitude: vehicleGps.latitude,
                                                                             longitude: vehicleGps.longitude)) {
                            BusView(rotation: vehicleGps.heading)
                        }
                                                                             .annotationTitles(.hidden)
                    }
                }
                VStack() {
                    HStack(alignment: .top) {
                        VStack {
                            Text("Departs: \(activeTrip.route.first!.departure.scheduled.formatted(date: .omitted, time: .shortened))")
                            HStack(spacing: 5) {
                                Button("< Previous") {
                                    Task {
                                        await viewModel.onPreviousTapped()
                                    }
                                }
                                Divider()
                                    .frame(maxHeight: 14)
                                Button("Next >") {
                                    Task {
                                        await viewModel.onNextTapped()
                                    }
                                }
                            }
                        }
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.white.shadow(.drop(color: .black, radius: 4)))
                        }
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.onRefreshTapped()
                            }
                        }) {
                            Label("", systemImage: "arrow.clockwise")
                        }
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.white.shadow(.drop(color: .black, radius: 4)))
                        }
                    }
                    .padding(20)
                    Spacer()
                    if let selectedStop {
                        VStack {
                            Text("\(selectedStop.location.name)")
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        
                    }
                }
                .animation(.easeInOut, value: selectedStop)
                
            }
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.onViewAppear()
        }
    }
    
    var pageTitle: String {
        switch viewModel.viewState {
        case .loading: return "Loading..."
        case .loaded(let trip):
            guard !trip.route.isEmpty else { fallthrough }
            return "\(trip.route.first!.location.name) - \(trip.route.last!.location.name)"
        case .error: return "Error"
        default: return ""
        }
    }
}


struct BusView: View {
    
    var rotation: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 15, height: 35)
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 6)
                    .foregroundStyle(Color.emberMedium)
                    .offset(y: -13)
            }
            .rotationEffect(.degrees(rotation))
    }
}

#Preview {
    TripView()
        .environmentObject(TripViewModel(routeService: RouteService()))
}
