//
//  Models.swift
//  BusView
//
//  Created by Rob Wilson on 06/11/2024.
//

import Foundation

// MARK: - Trip
struct Trip: Codable, Sendable {
    let route: [Route]
    let vehicle: Vehicle
    let description: TripDescription
}

// MARK: - Description
struct TripDescription: Codable, Sendable {
    let routeNumber: String
    let patternID: Int
    let calendarDate, type: String
    let isCancelled: Bool
    let routeID: Int

    enum CodingKeys: String, CodingKey {
        case routeNumber = "route_number"
        case patternID = "pattern_id"
        case calendarDate = "calendar_date"
        case type
        case isCancelled = "is_cancelled"
        case routeID = "route_id"
    }
}

// MARK: - Route
struct Route: Codable, Sendable {
    let id: Int
    let departure, arrival: Arrival
    let location: Location
    let allowBoarding, allowDropOff: Bool
    let bookingCutOffMins: Int
    let preBookedOnly, skipped: Bool

    enum CodingKeys: String, CodingKey {
        case id, departure, arrival, location
        case allowBoarding = "allow_boarding"
        case allowDropOff = "allow_drop_off"
        case bookingCutOffMins = "booking_cut_off_mins"
        case preBookedOnly = "pre_booked_only"
        case skipped
    }
}

// MARK: - Arrival
struct Arrival: Codable, Sendable {
    let scheduled: Date
    let actual: Date?
    let estimated: Date?
}

// MARK: - Location
struct Location: Codable, Sendable {
    let id: Int
    let name, regionName, code, codeDetail: String
    let detailedName: String
    let lon, lat: Double
    let atcoCode: String
    let zone: [Coordinate]
    let heading, areaID: Int
    let googlePlaceID, direction, localName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case regionName = "region_name"
        case code
        case codeDetail = "code_detail"
        case detailedName = "detailed_name"
        case lon, lat
        case atcoCode = "atco_code"
        case zone, heading
        case areaID = "area_id"
        case googlePlaceID = "google_place_id"
        case direction
        case localName = "local_name"
    }
}

// MARK: - Zone
struct Coordinate: Codable, Sendable {
    let latitude, longitude: Double
}

// MARK: - Vehicle
struct Vehicle: Codable, Sendable {
    let wheelchair, bicycle, seat, id: Int
    let plateNumber, name: String
    let hasWifi, hasToilet: Bool
    let type, brand, colour: String
    let isBackupVehicle: Bool
    let ownerID: Int
    let gps, secondaryGps: Gps

    enum CodingKeys: String, CodingKey {
        case wheelchair, bicycle, seat, id
        case plateNumber = "plate_number"
        case name
        case hasWifi = "has_wifi"
        case hasToilet = "has_toilet"
        case type, brand, colour
        case isBackupVehicle = "is_backup_vehicle"
        case ownerID = "owner_id"
        case gps
        case secondaryGps = "secondary_gps"
    }
}

// MARK: - Gps
struct Gps: Codable, Sendable {
    let lastUpdated: String
    let longitude, latitude, heading: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case longitude, latitude, heading
    }
}

// MARK: - QuoteResponse
struct QuoteResponse: Codable, Sendable {
    let quotes: [Quote]
    let minCardTransaction: Int

    enum CodingKeys: String, CodingKey {
        case quotes
        case minCardTransaction = "min_card_transaction"
    }
}

// MARK: - Quote
struct Quote: Codable, Sendable {
    let availability: Availability
    let prices: Prices
    let legs: [Leg]
    let bookable: Bool
}

// MARK: - Availability
struct Availability: Codable, Sendable {
    let seat, wheelchair, bicycle: Int
}

// MARK: - Leg
struct Leg: Codable, Sendable {
    let type: LegType
    let tripUid: String
    let origin, destination: Destination
    let departure, arrival: Arrival
    let description: LegDescription
    let tripType: TripType

    enum CodingKeys: String, CodingKey {
        case type
        case tripUid = "trip_uid"
        case origin, destination, departure, arrival, description
        case tripType = "trip_type"
    }
}

// MARK: - Description
struct LegDescription: Codable, Sendable {
    let brand, descriptionOperator: Brand
    let destinationBoard: DestinationBoard
    let numberPlate: String
    let vehicleType: VehicleType
    let colour: Colour
    let amenities: Amenities
    let isElectric: Bool

    enum CodingKeys: String, CodingKey {
        case brand
        case descriptionOperator = "operator"
        case destinationBoard = "destination_board"
        case numberPlate = "number_plate"
        case vehicleType = "vehicle_type"
        case colour, amenities
        case isElectric = "is_electric"
    }
}

// MARK: - Amenities
struct Amenities: Codable, Sendable {
    let hasWifi, hasToilet: Bool

    enum CodingKeys: String, CodingKey {
        case hasWifi = "has_wifi"
        case hasToilet = "has_toilet"
    }
}

enum Brand: String, Codable, Sendable {
    case ember = "Ember"
}

enum Colour: String, Codable, Sendable {
    case black = "Black"
    case colourBlack = "black"
}

enum DestinationBoard: String, Codable, Sendable {
    case e1 = "E1"
}

enum VehicleType: String, Codable, Sendable {
    case coach = "coach"
}

// MARK: - Destination
struct Destination: Codable, Sendable {
    let id: Int
    let atcoCode: AtcoCode
    let detailedName: DetailedName
    let googlePlaceID: GooglePlaceID?
    let lat, lon: Double
    let name: Name
    let regionName: RegionName
    let type: DestinationType
    let code: Code
    let codeDetail: CodeDetail
    let timezone: Timezone
    let heading: Int
    let zone: [Zone]
    let areaID, locationTimeID, bookingCutOffMins: Int
    let preBookedOnly, skipped: Bool
    let bookable: Date

    enum CodingKeys: String, CodingKey {
        case id
        case atcoCode = "atco_code"
        case detailedName = "detailed_name"
        case googlePlaceID = "google_place_id"
        case lat, lon, name
        case regionName = "region_name"
        case type, code
        case codeDetail = "code_detail"
        case timezone, heading, zone
        case areaID = "area_id"
        case locationTimeID = "location_time_id"
        case bookingCutOffMins = "booking_cut_off_mins"
        case preBookedOnly = "pre_booked_only"
        case skipped, bookable
    }
}

enum AtcoCode: String, Codable, Sendable {
    case the6200206490 = "6200206490"
    case the6400Ll99 = "6400LL99"
}

enum Code: String, Codable, Sendable {
    case dun = "DUN"
    case edi = "EDI"
}

enum CodeDetail: String, Codable, Sendable {
    case georgeStreet = "George Street"
    case slessorGardens = "Slessor Gardens"
}

enum DetailedName: String, Codable, Sendable {
    case georgeStreetStopGL = "George Street (Stop GL)"
    case slessorGardens = "Slessor Gardens"
}

enum GooglePlaceID: String, Codable, Sendable {
    case chIJ1QuappHHh0GRScSpuwtgbS = "ChIJ1QuappHHh0gRScSpuwtgb-s"
}

enum Name: String, Codable, Sendable {
    case dundeeSlessorGardens = "Dundee Slessor Gardens"
    case georgeStreet = "George Street"
}

enum RegionName: String, Codable, Sendable {
    case dundee = "Dundee"
    case edinburgh = "Edinburgh"
}

enum Timezone: String, Codable, Sendable {
    case europeLondon = "Europe/London"
}

enum DestinationType: String, Codable, Sendable {
    case stopPoint = "STOP_POINT"
}

// MARK: - Zone
struct Zone: Codable, Sendable {
    let longitude, latitude: Double
}

enum TripType: String, Codable, Sendable {
    case tripTypePublic = "public"
}

enum LegType: String, Codable, Sendable {
    case scheduledTransit = "scheduled_transit"
}

// MARK: - Prices
struct Prices: Codable, Sendable {
    let adult, child, youngChild, concession: Int
    let seat, wheelchair, bicycle: Int

    enum CodingKeys: String, CodingKey {
        case adult, child
        case youngChild = "young_child"
        case concession, seat, wheelchair, bicycle
    }
}
