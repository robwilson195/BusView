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
                    BusView(rotation: vehicleGps.heading)
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

extension Trip {
    var alreadyLeft: Bool {
        route.first?.departure.actual != nil
    }
}

extension Stop {
    enum TimingType {
        case departing, arriving
        var futureTensePrefix: String {
            switch self {
            case .departing:
                "Departing at "
            case .arriving:
                "Arriving at "
            }
        }
        var pastTensePrefix: String {
            switch self {
            case .departing:
                "Departed at "
            case .arriving:
                "Arrived at "
            }
        }
        var stopKeyPath: KeyPath<Stop, Timings> {
            switch self {
            case .departing:
                \.departure
            case .arriving:
                \.arrival
            }
        }
    }
    
    func timingText(timingType: TimingType) -> String {
        let text = self[keyPath: timingType.stopKeyPath].actual == nil ? timingType.futureTensePrefix : timingType.pastTensePrefix
        if let actual = self[keyPath: timingType.stopKeyPath].actual {
            return text.appending(actual.shortenedTime())
        } else if let estimated = self[keyPath: timingType.stopKeyPath].estimated {
            return text.appending(estimated.shortenedTime())
        } else {
            return text.appending(self[keyPath: timingType.stopKeyPath].scheduled.shortenedTime())
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


extension Date {
    func shortenedTime() -> String {
        formatted(date: .omitted, time: .shortened)
    }
}
