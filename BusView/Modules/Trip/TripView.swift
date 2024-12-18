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
            case .error:
                VStack(spacing: 20) {
                    Text("There was an issue fetching quotes for this route.\nPlease try again.")
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        Task {
                            await viewModel.onViewAppear()
                        }
                    }
                }
                .padding(40)
            case let .loaded(activeTrip, activeQuote):
                routeMap(activeTrip: activeTrip, activeQuote: activeQuote)
                VStack() {
                    HStack(alignment: .top) {
                        journeyOverlayView(activeTrip: activeTrip, activeQuote: activeQuote)
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.onRefreshTapped()
                            }
                        }) {
                            Label("", systemImage: "arrow.clockwise")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        .padding(4)
                        .background {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(.white.shadow(.drop(color: .black, radius: 4)))
                        }
                    }
                    .padding(20)
                    Spacer()
                }
                .alert(item: $viewModel.errorOverlayMessage) { message in
                    Alert(title: Text("Oops"), message: Text(message))
                }
            }
        }
        .navigationTitle(pageTitle)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.onViewAppear()
        }
    }
    
    func routeMap(activeTrip: Trip, activeQuote: Quote) -> some View {
        Map(interactionModes: [.pitch, .pan, .zoom], selection: $selectedStop) {
            ForEach(activeTrip.route) { stop in
                Marker(coordinate: CLLocationCoordinate2D(latitude: stop.location.lat, longitude: stop.location.lon)) {
                    var markerText = "\(stop.location.name)"
                    if stop.id == selectedStop?.id {
                        let timingText: String = (stop == activeTrip.route.first || stop.departure.actual != nil)
                        ? stop.timingText(timingType: .departing)
                        : stop.timingText(timingType: .arriving)
                        markerText.append(" - \(timingText)")
                    }
                    return Label(markerText, systemImage: "signpost.left.fill")
                }
                .tag(stop)
            }
            if let vehicleGps = activeTrip.vehicle.gps {
                Annotation("Bus", coordinate: CLLocationCoordinate2D(latitude: vehicleGps.latitude,
                                                                     longitude: vehicleGps.longitude)) {
                    BusAnnotationView(rotation: vehicleGps.heading)
                }
                                                                     .annotationTitles(.hidden)
            }
        }
    }

    func journeyOverlayView(activeTrip: Trip, activeQuote: Quote) -> some View {
        return VStack(alignment: .leading) {
            Text(activeTrip.route.first!.timingText(timingType: .departing))
                .font(.headline)
            Text(activeTrip.route.last!.timingText(timingType: .arriving))
                .font(.headline)
            if !activeTrip.alreadyLeft {
                availabilityTextView(quote: activeQuote)
            }
            HStack(spacing: 5) {
                Button("< Previous") {
                    selectedStop = nil
                    Task {
                        await viewModel.onPreviousTapped()
                    }
                }
                Divider()
                    .frame(maxHeight: 14)
                Button("Next >") {
                    selectedStop = nil
                    Task {
                        await viewModel.onNextTapped()
                    }
                }
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 6)
                .fill(.white.shadow(.drop(color: .black, radius: 4)))
        }
    }
    
    func availabilityTextView(quote: Quote) -> some View {
        let seats = quote.availability.seat
        
        switch seats {
        case 0: return Text("No seats available")
                .foregroundStyle(.red)
                .font(.footnote)
        case 1...8:
            return Text("Only ^[\(seats) seats](inflect: true) available.")
                .foregroundStyle(.yellow)
                .font(.footnote)
        case 9...20:
            return Text("^[\(seats) seats](inflect: true) available.")
                .font(.footnote)
        default:
            return Text("^[\(seats) seats](inflect: true) available.")
                .foregroundStyle(Color.emberDark)
                .font(.footnote)
        }
    }
    
    var pageTitle: String {
        switch viewModel.viewState {
        case .loading: return "Loading..."
        case .loaded(let trip, _):
            guard !trip.route.isEmpty else { return "" }
            return "\(trip.route.first!.location.name) - \(trip.route.last!.location.name)"
        case .error: return "Error"
        }
    }
}

#Preview {
    TripView()
        .environmentObject(TripViewModel(routeService: RouteService()))
}
