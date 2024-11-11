//
//  QuotesJSONData.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//

@testable import BusView
import Foundation

struct QuoteResponseJSON {
    static private let decoder: JSONDecoder = {
        let temp = JSONDecoder()
        temp.dateDecodingStrategy = .iso8601
        return temp
    }()
    
    static var quoteResponse: QuoteResponse {
        try! decoder.decode(QuoteResponse.self, from: quoteResponseString.data(using: .utf8)!)
    }
    
    static let quoteResponseString =
"""
{
  "quotes": [
    {
      "availability": {
        "seat": 29,
        "wheelchair": 1,
        "bicycle": 2
      },
      "prices": {
        "adult": 850,
        "child": 425,
        "young_child": 0,
        "concession": 0,
        "seat": 0,
        "wheelchair": 0,
        "bicycle": 0
      },
      "legs": [
        {
          "type": "scheduled_transit",
          "trip_uid": "c93gEcCxuQwzzWuYyAX4wQ",
          "adds_capacity_for_trip_uid": null,
          "origin": {
            "id": 218,
            "atco_code": "6400LL99",
            "detailed_name": "Slessor Gardens",
            "lat": 56.459319,
            "lon": -2.966036,
            "name": "Dundee Slessor Gardens",
            "region_name": "Dundee",
            "type": "STOP_POINT",
            "code": "DUN",
            "code_detail": "Slessor Gardens",
            "timezone": "Europe/London",
            "heading": 135,
            "zone": [
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              },
              {
                "longitude": -2.965899508048143,
                "latitude": 56.459318863936254
              },
              {
                "longitude": -2.966088154257807,
                "latitude": 56.45922455823586
              },
              {
                "longitude": -2.966443119818907,
                "latitude": 56.459443989461406
              },
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              }
            ],
            "area_id": 13,
            "location_time_id": 1373997,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T09:00:00+00:00"
          },
          "destination": {
            "id": 175,
            "atco_code": "6200206490",
            "detailed_name": "George Street (Stop GL)",
            "google_place_id": "ChIJ1QuappHHh0gRScSpuwtgb-s",
            "lat": 55.95395,
            "lon": -3.19549,
            "name": "George Street",
            "region_name": "Edinburgh",
            "type": "STOP_POINT",
            "code": "EDI",
            "code_detail": "George Street",
            "timezone": "Europe/London",
            "heading": 75,
            "zone": [
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              },
              {
                "longitude": -3.19581977130998,
                "latitude": 55.95377939447385
              },
              {
                "longitude": -3.195124451156287,
                "latitude": 55.95389942984703
              },
              {
                "longitude": -3.195210121329124,
                "latitude": 55.954050314770164
              },
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              }
            ],
            "area_id": 42,
            "location_time_id": 1374010,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T11:01:00+00:00"
          },
          "departure": {
            "scheduled": "2024-11-11T09:00:00+00:00",
            "actual": "2024-11-11T09:08:07+00:00",
            "estimated": "2024-11-11T09:05:41+00:00"
          },
          "arrival": {
            "scheduled": "2024-11-11T11:01:00+00:00",
            "estimated": "2024-11-11T11:02:00+00:00"
          },
          "description": {
            "brand": "Ember",
            "operator": "Ember",
            "destination_board": "E1",
            "number_plate": "YD70 CHY",
            "vehicle_type": "coach",
            "colour": "black",
            "amenities": {
              "has_wifi": true,
              "has_toilet": false
            },
            "is_electric": true
          },
          "trip_type": "public"
        }
      ],
      "bookable": true
    },
    {
      "availability": {
        "seat": 27,
        "wheelchair": 1,
        "bicycle": 2
      },
      "prices": {
        "adult": 850,
        "child": 425,
        "young_child": 0,
        "concession": 0,
        "seat": 0,
        "wheelchair": 0,
        "bicycle": 0
      },
      "legs": [
        {
          "type": "scheduled_transit",
          "trip_uid": "6EcqQbd5DdKUaDx8LceQWd",
          "adds_capacity_for_trip_uid": null,
          "origin": {
            "id": 218,
            "atco_code": "6400LL99",
            "detailed_name": "Slessor Gardens",
            "lat": 56.459319,
            "lon": -2.966036,
            "name": "Dundee Slessor Gardens",
            "region_name": "Dundee",
            "type": "STOP_POINT",
            "code": "DUN",
            "code_detail": "Slessor Gardens",
            "timezone": "Europe/London",
            "heading": 135,
            "zone": [
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              },
              {
                "longitude": -2.965899508048143,
                "latitude": 56.459318863936254
              },
              {
                "longitude": -2.966088154257807,
                "latitude": 56.45922455823586
              },
              {
                "longitude": -2.966443119818907,
                "latitude": 56.459443989461406
              },
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              }
            ],
            "area_id": 13,
            "location_time_id": 1374051,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T09:27:00+00:00"
          },
          "destination": {
            "id": 175,
            "atco_code": "6200206490",
            "detailed_name": "George Street (Stop GL)",
            "google_place_id": "ChIJ1QuappHHh0gRScSpuwtgb-s",
            "lat": 55.95395,
            "lon": -3.19549,
            "name": "George Street",
            "region_name": "Edinburgh",
            "type": "STOP_POINT",
            "code": "EDI",
            "code_detail": "George Street",
            "timezone": "Europe/London",
            "heading": 75,
            "zone": [
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              },
              {
                "longitude": -3.19581977130998,
                "latitude": 55.95377939447385
              },
              {
                "longitude": -3.195124451156287,
                "latitude": 55.95389942984703
              },
              {
                "longitude": -3.195210121329124,
                "latitude": 55.954050314770164
              },
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              }
            ],
            "area_id": 42,
            "location_time_id": 1374050,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T11:28:00+00:00"
          },
          "departure": {
            "scheduled": "2024-11-11T09:30:00+00:00",
            "actual": "2024-11-11T09:30:10+00:00",
            "estimated": "2024-11-11T09:30:00+00:00"
          },
          "arrival": {
            "scheduled": "2024-11-11T11:28:00+00:00",
            "estimated": "2024-11-11T11:28:00+00:00"
          },
          "description": {
            "brand": "Ember",
            "operator": "Ember",
            "destination_board": "E1",
            "number_plate": "SG24 UHU",
            "vehicle_type": "coach",
            "colour": "Black",
            "amenities": {
              "has_wifi": true,
              "has_toilet": true
            },
            "is_electric": true
          },
          "trip_type": "public"
        }
      ],
      "bookable": true
    },
    {
      "availability": {
        "seat": 21,
        "wheelchair": 1,
        "bicycle": 1
      },
      "prices": {
        "adult": 850,
        "child": 425,
        "young_child": 0,
        "concession": 0,
        "seat": 0,
        "wheelchair": 0,
        "bicycle": 0
      },
      "legs": [
        {
          "type": "scheduled_transit",
          "trip_uid": "YMidJi5QTjS4Ji5vuK7TCb",
          "adds_capacity_for_trip_uid": null,
          "origin": {
            "id": 218,
            "atco_code": "6400LL99",
            "detailed_name": "Slessor Gardens",
            "lat": 56.459319,
            "lon": -2.966036,
            "name": "Dundee Slessor Gardens",
            "region_name": "Dundee",
            "type": "STOP_POINT",
            "code": "DUN",
            "code_detail": "Slessor Gardens",
            "timezone": "Europe/London",
            "heading": 135,
            "zone": [
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              },
              {
                "longitude": -2.965899508048143,
                "latitude": 56.459318863936254
              },
              {
                "longitude": -2.966088154257807,
                "latitude": 56.45922455823586
              },
              {
                "longitude": -2.966443119818907,
                "latitude": 56.459443989461406
              },
              {
                "longitude": -2.966276800467473,
                "latitude": 56.459542218608334
              }
            ],
            "area_id": 13,
            "location_time_id": 1374079,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T10:00:00+00:00"
          },
          "destination": {
            "id": 175,
            "atco_code": "6200206490",
            "detailed_name": "George Street (Stop GL)",
            "google_place_id": "ChIJ1QuappHHh0gRScSpuwtgb-s",
            "lat": 55.95395,
            "lon": -3.19549,
            "name": "George Street",
            "region_name": "Edinburgh",
            "type": "STOP_POINT",
            "code": "EDI",
            "code_detail": "George Street",
            "timezone": "Europe/London",
            "heading": 75,
            "zone": [
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              },
              {
                "longitude": -3.19581977130998,
                "latitude": 55.95377939447385
              },
              {
                "longitude": -3.195124451156287,
                "latitude": 55.95389942984703
              },
              {
                "longitude": -3.195210121329124,
                "latitude": 55.954050314770164
              },
              {
                "longitude": -3.195900884778076,
                "latitude": 55.953931988302834
              }
            ],
            "area_id": 42,
            "location_time_id": 1374092,
            "booking_cut_off_mins": 0,
            "pre_booked_only": false,
            "skipped": false,
            "bookable": "2024-11-11T12:01:00+00:00"
          },
          "departure": {
            "scheduled": "2024-11-11T10:00:00+00:00",
            "estimated": "2024-11-11T10:00:33+00:00"
          },
          "arrival": {
            "scheduled": "2024-11-11T12:01:00+00:00",
            "estimated": "2024-11-11T12:01:00+00:00"
          },
          "description": {
            "brand": "Ember",
            "operator": "Ember",
            "destination_board": "E1",
            "number_plate": "SG71 OTA",
            "vehicle_type": "coach",
            "colour": "black",
            "amenities": {
              "has_wifi": true,
              "has_toilet": true
            },
            "is_electric": true
          },
          "trip_type": "public"
        }
      ],
      "bookable": true
    }
  ],
  "min_card_transaction": 30
}
"""
}
