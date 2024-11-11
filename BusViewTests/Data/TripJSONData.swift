//
//  TripJSONData.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//
@testable import BusView
import Foundation

struct TripJSONData {
    static private let testDecoder: JSONDecoder = {
        let temp = JSONDecoder()
        temp.dateDecodingStrategy = .iso8601
        return temp
    }()
    
    static var tripResponse: Trip {
        try! testDecoder.decode(Trip.self, from: tripResponseString.data(using: .utf8)!)
    }
    static let tripResponseString =
"""
{
  "route": [
    {
      "id": 1374025,
      "departure": {
        "scheduled": "2024-11-11T07:17:00+00:00",
        "actual": "2024-11-11T07:17:37+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:17:00+00:00",
        "actual": "2024-11-11T07:10:33+00:00"
      },
      "location": {
        "id": 168,
        "type": "DEPOT",
        "name": "Aberdeen Bridge of Don Depot",
        "region_name": "Aberdeen",
        "detailed_name": "Bridge of Don Depot",
        "lon": -2.0920950563527385,
        "lat": 57.18653578702499,
        "atco_code": "-4",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.18740478595002,
            "longitude": -2.0926265598024782
          },
          {
            "latitude": 57.187189635205115,
            "longitude": -2.090959015591358
          },
          {
            "latitude": 57.18603210269283,
            "longitude": -2.091633973962526
          },
          {
            "latitude": 57.18631180718056,
            "longitude": -2.0931744671861323
          },
          {
            "latitude": 57.18740478595002,
            "longitude": -2.0926265598024782
          }
        ]
      },
      "allow_boarding": false,
      "allow_drop_off": false,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    },
    {
      "id": 1374026,
      "departure": {
        "scheduled": "2024-11-11T07:21:00+00:00",
        "actual": "2024-11-11T07:21:41+00:00",
        "estimated": "2024-11-11T07:22:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:21:00+00:00",
        "actual": "2024-11-11T07:21:38+00:00",
        "estimated": "2024-11-11T07:22:00+00:00"
      },
      "location": {
        "id": 170,
        "type": "STOP_POINT",
        "name": "Bridge of Don P&R",
        "region_name": "Aberdeen",
        "code": "BOD",
        "code_detail": "Br. of Don P&R",
        "detailed_name": "Bridge of Don P&R",
        "lon": -2.0891,
        "lat": 57.18411,
        "atco_code": "639003541",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.18370941445839,
            "longitude": -2.088740192996846
          },
          {
            "latitude": 57.183803946336184,
            "longitude": -2.089596641332051
          },
          {
            "latitude": 57.184447530721854,
            "longitude": -2.0892741761252682
          },
          {
            "latitude": 57.18434801845642,
            "longitude": -2.0884209630949644
          },
          {
            "latitude": 57.18370941445839,
            "longitude": -2.088740192996846
          }
        ],
        "heading": 17,
        "area_id": 171
      },
      "allow_boarding": true,
      "allow_drop_off": false,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    },
    {
      "id": 1374027,
      "departure": {
        "scheduled": "2024-11-11T07:24:00+00:00",
        "actual": "2024-11-11T07:26:52+00:00",
        "estimated": "2024-11-11T07:24:48+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:24:00+00:00",
        "actual": "2024-11-11T07:25:04+00:00",
        "estimated": "2024-11-11T07:24:48+00:00"
      },
      "location": {
        "id": 176,
        "type": "STOP_POINT",
        "name": "Bridge of Don (Balgownie Crescent)",
        "region_name": "Aberdeen",
        "code": "BOD",
        "code_detail": "Balgownie Cres.",
        "detailed_name": "Bridge of Don (Balgownie Crescent)",
        "lon": -2.09024,
        "lat": 57.17881,
        "google_place_id": "ChIJTwJku-ANhEgRPjNeSZ6_OlU",
        "atco_code": "639005142",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.17891720978589,
            "longitude": -2.0903631589624236
          },
          {
            "latitude": 57.178926054375864,
            "longitude": -2.090238055004582
          },
          {
            "latitude": 57.17864302644794,
            "longitude": -2.0902162977945222
          },
          {
            "latitude": 57.17864007822894,
            "longitude": -2.0903414017523643
          },
          {
            "latitude": 57.17891720978589,
            "longitude": -2.0903631589624236
          }
        ],
        "heading": 175,
        "area_id": 178
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374028,
      "departure": {
        "scheduled": "2024-11-11T07:25:00+00:00",
        "estimated": "2024-11-11T07:25:52+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:25:00+00:00",
        "estimated": "2024-11-11T07:25:52+00:00"
      },
      "location": {
        "id": 180,
        "type": "STOP_POINT",
        "name": "Old Aberdeen",
        "region_name": "Old Aberdeen",
        "code": "ABD",
        "code_detail": "Old Aberdeen",
        "detailed_name": "Lord Hay's Road",
        "lon": -2.0939,
        "lat": 57.17203,
        "google_place_id": "ChIJgTgTRgoOhEgRF2RcMIEJ_n4",
        "atco_code": "639004852",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.1721352131523,
            "longitude": -2.093762398375694
          },
          {
            "latitude": 57.17218206460087,
            "longitude": -2.0939016357458944
          },
          {
            "latitude": 57.17197904122822,
            "longitude": -2.0941176937341357
          },
          {
            "latitude": 57.1719399981441,
            "longitude": -2.0939688537866803
          },
          {
            "latitude": 57.1721352131523,
            "longitude": -2.093762398375694
          }
        ],
        "heading": 205,
        "area_id": 181
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374029,
      "departure": {
        "scheduled": "2024-11-11T07:27:00+00:00",
        "actual": "2024-11-11T07:30:09+00:00",
        "estimated": "2024-11-11T07:29:49+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:27:00+00:00",
        "actual": "2024-11-11T07:29:51+00:00",
        "estimated": "2024-11-11T07:29:49+00:00"
      },
      "location": {
        "id": 182,
        "type": "STOP_POINT",
        "name": "University of Aberdeen",
        "region_name": "Aberdeen",
        "code": "ABD",
        "code_detail": "University",
        "detailed_name": "University of Aberdeen",
        "lon": -2.09715,
        "lat": 57.16629,
        "google_place_id": "ChIJ72nzjQ4OhEgRLN385P4bUQM",
        "atco_code": "639003662",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.166419832766636,
            "longitude": -2.0972446141920353
          },
          {
            "latitude": 57.16639072996322,
            "longitude": -2.097122624859211
          },
          {
            "latitude": 57.16612351224287,
            "longitude": -2.0972397346187224
          },
          {
            "latitude": 57.16615261525662,
            "longitude": -2.0973714830981733
          },
          {
            "latitude": 57.166419832766636,
            "longitude": -2.0972446141920353
          }
        ],
        "heading": 195,
        "area_id": 184
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374030,
      "departure": {
        "scheduled": "2024-11-11T07:29:00+00:00",
        "estimated": "2024-11-11T07:30:09+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:29:00+00:00",
        "estimated": "2024-11-11T07:30:09+00:00"
      },
      "location": {
        "id": 185,
        "type": "STOP_POINT",
        "name": "Aberdeen Pittodrie",
        "region_name": "Aberdeen",
        "code": "ABD",
        "code_detail": "Pittodrie",
        "detailed_name": "Pittodrie",
        "lon": -2.095589,
        "lat": 57.158051,
        "google_place_id": "ChIJQei0WxEOhEgRLFnAWPFInQs",
        "atco_code": "639003632",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.15810982238048,
            "longitude": -2.0957429287753215
          },
          {
            "latitude": 57.158134181207465,
            "longitude": -2.095590215177021
          },
          {
            "latitude": 57.15791007939407,
            "longitude": -2.095536316259974
          },
          {
            "latitude": 57.15789546401124,
            "longitude": -2.0956980130111154
          },
          {
            "latitude": 57.15810982238048,
            "longitude": -2.0957429287753215
          }
        ],
        "heading": 175,
        "area_id": 187
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374031,
      "departure": {
        "scheduled": "2024-11-11T07:36:00+00:00",
        "actual": "2024-11-11T07:36:39+00:00",
        "estimated": "2024-11-11T07:36:12+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:36:00+00:00",
        "actual": "2024-11-11T07:36:35+00:00",
        "estimated": "2024-11-11T07:36:12+00:00"
      },
      "location": {
        "id": 173,
        "type": "STOP_POINT",
        "name": "Aberdeen Union Street",
        "region_name": "Aberdeen",
        "code": "ABD",
        "code_detail": "Union Street",
        "detailed_name": "Union Street (Stop G5)",
        "lon": -2.096011,
        "lat": 57.14724,
        "google_place_id": "ChIJkXqtajwOhEgRORsDG0J2PCc",
        "atco_code": "639006445",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.14722214167049,
            "longitude": -2.0960017829845796
          },
          {
            "latitude": 57.147328974986884,
            "longitude": -2.095608809977069
          },
          {
            "latitude": 57.14740207272026,
            "longitude": -2.095698641505481
          },
          {
            "latitude": 57.14729067193069,
            "longitude": -2.0960771434758287
          },
          {
            "latitude": 57.14722214167049,
            "longitude": -2.0960017829845796
          }
        ],
        "heading": 243,
        "area_id": 174
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    },
    {
      "id": 1374032,
      "departure": {
        "scheduled": "2024-11-11T07:47:00+00:00",
        "estimated": "2024-11-11T07:47:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:47:00+00:00",
        "estimated": "2024-11-11T07:45:39+00:00"
      },
      "location": {
        "id": 188,
        "type": "STOP_POINT",
        "name": "Bridge of Dee",
        "region_name": "Aberdeen",
        "code": "ABD",
        "code_detail": "Bridge of Dee",
        "detailed_name": "Bridge of Dee (Southbound)",
        "lon": -2.11535,
        "lat": 57.12319,
        "google_place_id": "ChIJbUHgAioQhEgR-kVtx2x4zBE",
        "atco_code": "639002402",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.12342768638536,
            "longitude": -2.1151980608631966
          },
          {
            "latitude": 57.1231058468988,
            "longitude": -2.1156741679637796
          },
          {
            "latitude": 57.122998566448416,
            "longitude": -2.1154316228370678
          },
          {
            "latitude": 57.12329114876298,
            "longitude": -2.1149644988893255
          },
          {
            "latitude": 57.12342768638536,
            "longitude": -2.1151980608631966
          }
        ],
        "heading": 220,
        "area_id": 190
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374033,
      "departure": {
        "scheduled": "2024-11-11T07:52:00+00:00",
        "actual": "2024-11-11T07:56:05+00:00",
        "estimated": "2024-11-11T07:56:05+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:52:00+00:00",
        "actual": "2024-11-11T07:55:57+00:00",
        "estimated": "2024-11-11T07:56:05+00:00"
      },
      "location": {
        "id": 191,
        "type": "STOP_POINT",
        "name": "Portlethen",
        "region_name": "Portlethen",
        "code": "PRT",
        "code_detail": "Portlethen",
        "detailed_name": "Roadside of Cookston",
        "lon": -2.13432,
        "lat": 57.06708,
        "google_place_id": "ChIJddgkPbwahEgRsanaiwnKNHU",
        "atco_code": "630042452",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.06730870443895,
            "longitude": -2.1341300742886693
          },
          {
            "latitude": 57.067147686844486,
            "longitude": -2.133814152930346
          },
          {
            "latitude": 57.06672367050374,
            "longitude": -2.134564466156363
          },
          {
            "latitude": 57.0669222610386,
            "longitude": -2.134860642429791
          },
          {
            "latitude": 57.06730870443895,
            "longitude": -2.1341300742886693
          }
        ],
        "heading": 225,
        "area_id": 193
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374034,
      "departure": {
        "scheduled": "2024-11-11T07:57:00+00:00",
        "estimated": "2024-11-11T07:59:05+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T07:57:00+00:00",
        "estimated": "2024-11-11T07:59:05+00:00"
      },
      "location": {
        "id": 194,
        "type": "STOP_POINT",
        "name": "Newtonhill (Cairnhill Road)",
        "region_name": "Newtonhill",
        "code": "NEWT",
        "code_detail": "Newtonhill",
        "detailed_name": "Cairnhill Road",
        "lon": -2.15763,
        "lat": 57.03086,
        "google_place_id": "ChIJnVD6FAQbhEgRAlsb1LHmRnU",
        "atco_code": "630045021",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 57.03098080741914,
            "longitude": -2.157603374105708
          },
          {
            "latitude": 57.030948078745254,
            "longitude": -2.1574429941804842
          },
          {
            "latitude": 57.030758251868285,
            "longitude": -2.157623421596362
          },
          {
            "latitude": 57.03079752647408,
            "longitude": -2.1577557350346708
          },
          {
            "latitude": 57.03098080741914,
            "longitude": -2.157603374105708
          }
        ],
        "heading": 200,
        "area_id": 196
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374035,
      "departure": {
        "scheduled": "2024-11-11T08:11:00+00:00",
        "estimated": "2024-11-11T08:12:05+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T08:11:00+00:00",
        "estimated": "2024-11-11T08:12:05+00:00"
      },
      "location": {
        "id": 197,
        "type": "STOP_POINT",
        "name": "Drumlithie",
        "region_name": "Drumlithie",
        "code": "DRML",
        "code_detail": "Drumlithie",
        "detailed_name": "Road End (on A90)",
        "lon": -2.33708,
        "lat": 56.91208,
        "google_place_id": "ChIJ66DDah0ghEgRuJH714EZCSk",
        "atco_code": "630040642",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.9123116265985,
            "longitude": -2.3370577139598367
          },
          {
            "latitude": 56.91207895991309,
            "longitude": -2.336588905990513
          },
          {
            "latitude": 56.91165433947434,
            "longitude": -2.3373773557571025
          },
          {
            "latitude": 56.91192190908073,
            "longitude": -2.3377928900935485
          },
          {
            "latitude": 56.9123116265985,
            "longitude": -2.3370577139598367
          }
        ],
        "heading": 225,
        "area_id": 199
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374036,
      "departure": {
        "scheduled": "2024-11-11T08:16:00+00:00",
        "estimated": "2024-11-11T08:17:05+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T08:16:00+00:00",
        "estimated": "2024-11-11T08:17:05+00:00"
      },
      "location": {
        "id": 203,
        "type": "STOP_POINT",
        "name": "Fordoun",
        "region_name": "Fordoun",
        "code": "FRDN",
        "code_detail": "Fordoun",
        "detailed_name": "A90 Southbound",
        "lon": -2.41031,
        "lat": 56.87153,
        "atco_code": "630040632",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.871728629494406,
            "longitude": -2.41031577325491
          },
          {
            "latitude": 56.87164097250989,
            "longitude": -2.4100698382713683
          },
          {
            "latitude": 56.87132540566409,
            "longitude": -2.4104120086832523
          },
          {
            "latitude": 56.87141890722938,
            "longitude": -2.410668636492165
          },
          {
            "latitude": 56.871728629494406,
            "longitude": -2.41031577325491
          }
        ],
        "heading": 210,
        "area_id": 205
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374037,
      "departure": {
        "scheduled": "2024-11-11T08:34:00+00:00",
        "actual": "2024-11-11T08:34:27+00:00",
        "estimated": "2024-11-11T08:34:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T08:34:00+00:00",
        "actual": "2024-11-11T08:33:17+00:00",
        "estimated": "2024-11-11T08:33:14+00:00"
      },
      "location": {
        "id": 201,
        "type": "STOP_POINT",
        "name": "Brechin",
        "region_name": "Brechin",
        "code": "BRC",
        "code_detail": "Brechin",
        "detailed_name": "Bank Street",
        "lon": -2.65805,
        "lat": 56.73286,
        "google_place_id": "ChIJl89DWeiFhkgRFREHa9PtFUU",
        "atco_code": "6490IM460",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.73289017743905,
            "longitude": -2.658153058123235
          },
          {
            "latitude": 56.732773769144835,
            "longitude": -2.6579772242360153
          },
          {
            "latitude": 56.73291678499856,
            "longitude": -2.6577104417864406
          },
          {
            "latitude": 56.73301323724382,
            "longitude": -2.6578923389111506
          },
          {
            "latitude": 56.73289017743905,
            "longitude": -2.658153058123235
          }
        ],
        "area_id": 202
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374038,
      "departure": {
        "scheduled": "2024-11-11T08:53:00+00:00",
        "actual": "2024-11-11T08:54:28+00:00",
        "estimated": "2024-11-11T08:53:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T08:53:00+00:00",
        "actual": "2024-11-11T08:52:45+00:00",
        "estimated": "2024-11-11T08:52:36+00:00"
      },
      "location": {
        "id": 206,
        "type": "STOP_POINT",
        "name": "Forfar",
        "region_name": "Forfar",
        "code": "FRF",
        "code_detail": "Forfar",
        "detailed_name": "Lidl (Westbound)",
        "lon": -2.8921,
        "lat": 56.64703,
        "google_place_id": "ChIJV0dsZo5jhkgR7Fjc0sFff3Y",
        "atco_code": "6490IM1418",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.64715867548491,
            "longitude": -2.8917169422182307
          },
          {
            "latitude": 56.64702625518572,
            "longitude": -2.8916687713730336
          },
          {
            "latitude": 56.646946802783035,
            "longitude": -2.8924214408292457
          },
          {
            "latitude": 56.647084189123824,
            "longitude": -2.8924816543857426
          },
          {
            "latitude": 56.64715867548491,
            "longitude": -2.8917169422182307
          }
        ],
        "heading": 265,
        "area_id": 208
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374039,
      "departure": {
        "scheduled": "2024-11-11T09:07:00+00:00",
        "estimated": "2024-11-11T09:07:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:07:00+00:00",
        "estimated": "2024-11-11T09:05:52+00:00"
      },
      "location": {
        "id": 210,
        "type": "STOP_POINT",
        "name": "Inveraldie",
        "region_name": "Inveraldie",
        "code": "INV",
        "code_detail": "Inveraldie",
        "detailed_name": "A90 Southbound",
        "lon": -2.94438,
        "lat": 56.52195,
        "google_place_id": "ChIJQXO7aIFdhkgRhI5tYnarndw",
        "atco_code": "6490IM646",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.52217224477298,
            "longitude": -2.9446046705966897
          },
          {
            "latitude": 56.522167841773395,
            "longitude": -2.9442853895520833
          },
          {
            "latitude": 56.521692314806366,
            "longitude": -2.9442853895520833
          },
          {
            "latitude": 56.52167910563876,
            "longitude": -2.94462063464892
          },
          {
            "latitude": 56.52217224477298,
            "longitude": -2.9446046705966897
          }
        ],
        "heading": 180,
        "area_id": 211
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374040,
      "departure": {
        "scheduled": "2024-11-11T09:11:00+00:00",
        "estimated": "2024-11-11T09:11:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:11:00+00:00",
        "estimated": "2024-11-11T09:09:50+00:00"
      },
      "location": {
        "id": 213,
        "type": "STOP_POINT",
        "name": "Dundee Mill O' Mains",
        "region_name": "Dundee",
        "code": "DUN",
        "code_detail": "Mill O' Mains",
        "detailed_name": "Mill O' Mains (A90 Southbound)",
        "lon": -2.9504,
        "lat": 56.488798,
        "google_place_id": "ChIJ4_BZ3QZdhkgRE2InGJbB9_w",
        "atco_code": "6400PT1706",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.4889761517699,
            "longitude": -2.9506168995934066
          },
          {
            "latitude": 56.4889686715368,
            "longitude": -2.950352698880149
          },
          {
            "latitude": 56.488609618613,
            "longitude": -2.950366247634675
          },
          {
            "latitude": 56.48861335876517,
            "longitude": -2.950610125216143
          },
          {
            "latitude": 56.4889761517699,
            "longitude": -2.9506168995934066
          }
        ],
        "heading": 180,
        "area_id": 214
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374041,
      "departure": {
        "scheduled": "2024-11-11T09:17:00+00:00",
        "actual": "2024-11-11T09:15:56+00:00",
        "estimated": "2024-11-11T09:17:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:17:00+00:00",
        "actual": "2024-11-11T09:15:27+00:00",
        "estimated": "2024-11-11T09:15:10+00:00"
      },
      "location": {
        "id": 215,
        "type": "STOP_POINT",
        "name": "Dundee Stobswell",
        "region_name": "Dundee",
        "code": "DUN",
        "code_detail": "Stobswell",
        "detailed_name": "Stobswell (Albert Street Southbound)",
        "lon": -2.956756,
        "lat": 56.472029,
        "google_place_id": "ChIJW3TA6vpchkgRp957bEYrTt8",
        "atco_code": "6400PT1708",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.47199633594768,
            "longitude": -2.956874587384274
          },
          {
            "latitude": 56.471973200632654,
            "longitude": -2.956734968550029
          },
          {
            "latitude": 56.47219298555617,
            "longitude": -2.9566581781911947
          },
          {
            "latitude": 56.472223832461154,
            "longitude": -2.956804777967152
          },
          {
            "latitude": 56.47199633594768,
            "longitude": -2.956874587384274
          }
        ],
        "heading": 190,
        "area_id": 217
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374051,
      "departure": {
        "scheduled": "2024-11-11T09:30:00+00:00",
        "actual": "2024-11-11T09:30:10+00:00",
        "estimated": "2024-11-11T09:30:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:27:00+00:00",
        "actual": "2024-11-11T09:23:40+00:00",
        "estimated": "2024-11-11T09:23:08+00:00"
      },
      "location": {
        "id": 218,
        "type": "STOP_POINT",
        "name": "Dundee Slessor Gardens",
        "region_name": "Dundee",
        "code": "DUN",
        "code_detail": "Slessor Gardens",
        "detailed_name": "Slessor Gardens",
        "lon": -2.966036,
        "lat": 56.459319,
        "atco_code": "6400LL99",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.459542218608334,
            "longitude": -2.966276800467473
          },
          {
            "latitude": 56.459318863936254,
            "longitude": -2.965899508048143
          },
          {
            "latitude": 56.45922455823586,
            "longitude": -2.966088154257807
          },
          {
            "latitude": 56.459443989461406,
            "longitude": -2.9664431198189067
          },
          {
            "latitude": 56.459542218608334,
            "longitude": -2.966276800467473
          }
        ],
        "heading": 135,
        "area_id": 13
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    },
    {
      "id": 1374042,
      "departure": {
        "scheduled": "2024-11-11T09:39:00+00:00",
        "actual": "2024-11-11T09:39:28+00:00",
        "estimated": "2024-11-11T09:39:01+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:39:00+00:00",
        "actual": "2024-11-11T09:38:46+00:00",
        "estimated": "2024-11-11T09:39:01+00:00"
      },
      "location": {
        "id": 2,
        "type": "STOP_POINT",
        "name": "Dundee West",
        "region_name": "Dundee West",
        "code": "DUN",
        "code_detail": "Dundee West",
        "detailed_name": "Apollo Way",
        "lon": -3.05468,
        "lat": 56.462677,
        "google_place_id": "ChIJE2gJVwlDhkgRBp7tM4HaqS0",
        "atco_code": "6400L00019",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.46256507145948,
            "longitude": -3.0550262330871196
          },
          {
            "latitude": 56.462403053205456,
            "longitude": -3.0547294020652775
          },
          {
            "latitude": 56.46270436715984,
            "longitude": -3.0541500449180607
          },
          {
            "latitude": 56.462859468797895,
            "longitude": -3.054468333612022
          },
          {
            "latitude": 56.46256507145948,
            "longitude": -3.0550262330871196
          }
        ],
        "heading": 45,
        "area_id": 14
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374043,
      "departure": {
        "scheduled": "2024-11-11T09:47:00+00:00",
        "actual": "2024-11-11T09:46:29+00:00",
        "estimated": "2024-11-11T09:47:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T09:47:00+00:00",
        "actual": "2024-11-11T09:46:00+00:00",
        "estimated": "2024-11-11T09:46:15+00:00"
      },
      "location": {
        "id": 3,
        "type": "STOP_POINT",
        "name": "Inchture",
        "region_name": "Inchture",
        "code": "INCT",
        "code_detail": "Inchture",
        "detailed_name": "Road End (Westbound)",
        "direction": "WESTBOUND",
        "lon": -3.170071,
        "lat": 56.447108,
        "google_place_id": "ChIJa-OPGCRBhkgRqINJzMi0mc0",
        "atco_code": "64800191",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.44792778370844,
            "longitude": -3.169394731085048
          },
          {
            "latitude": 56.447749890193236,
            "longitude": -3.1689512727461984
          },
          {
            "latitude": 56.445903701655475,
            "longitude": -3.171147107641445
          },
          {
            "latitude": 56.44614090434802,
            "longitude": -3.171762228012084
          },
          {
            "latitude": 56.44792778370844,
            "longitude": -3.169394731085048
          }
        ],
        "heading": 225,
        "area_id": 15
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374044,
      "departure": {
        "scheduled": "2024-11-11T10:04:00+00:00",
        "actual": "2024-11-11T10:06:31+00:00",
        "estimated": "2024-11-11T10:05:17+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T10:04:00+00:00",
        "actual": "2024-11-11T10:05:18+00:00",
        "estimated": "2024-11-11T10:05:17+00:00"
      },
      "location": {
        "id": 48,
        "type": "STOP_POINT",
        "name": "Bridge of Earn",
        "region_name": "Bridge of Earn",
        "code": "BOE",
        "code_detail": "Bridge of Earn",
        "detailed_name": "Old Edinburgh Road",
        "lon": -3.402653,
        "lat": 56.344795,
        "google_place_id": "ChIJK_IWfX06hkgRdYmM9l9rUBU",
        "atco_code": "64802696",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.34488518734358,
            "longitude": -3.4022462363645896
          },
          {
            "latitude": 56.344655280875656,
            "longitude": -3.40271830515121
          },
          {
            "latitude": 56.34488915135803,
            "longitude": -3.403126001248893
          },
          {
            "latitude": 56.345130948022884,
            "longitude": -3.402696847479091
          },
          {
            "latitude": 56.34488518734358,
            "longitude": -3.4022462363645896
          }
        ],
        "heading": 135,
        "area_id": 54
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374045,
      "departure": {
        "scheduled": "2024-11-11T10:21:00+00:00",
        "actual": "2024-11-11T10:21:42+00:00",
        "estimated": "2024-11-11T10:21:03+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T10:21:00+00:00",
        "actual": "2024-11-11T10:21:07+00:00",
        "estimated": "2024-11-11T10:21:03+00:00"
      },
      "location": {
        "id": 6,
        "type": "STOP_POINT",
        "name": "Kinross P&R",
        "region_name": "Kinross",
        "code": "KIN",
        "code_detail": "Kinross P&R",
        "detailed_name": "Park & Ride",
        "lon": -3.433365,
        "lat": 56.206317,
        "google_place_id": "ChIJi2G0f3syhkgRpiaZ20yWrj0",
        "atco_code": "64804323",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.20657269850862,
            "longitude": -3.433522582054137
          },
          {
            "latitude": 56.20603563039676,
            "longitude": -3.433393836021422
          },
          {
            "latitude": 56.20609232127476,
            "longitude": -3.432476520538329
          },
          {
            "latitude": 56.206718899081004,
            "longitude": -3.4326803684234615
          },
          {
            "latitude": 56.206638339650894,
            "longitude": -3.4335654973983756
          },
          {
            "latitude": 56.20657269850862,
            "longitude": -3.433522582054137
          }
        ],
        "heading": 90,
        "area_id": 17
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374046,
      "departure": {
        "scheduled": "2024-11-11T10:39:00+00:00",
        "estimated": "2024-11-11T10:39:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T10:39:00+00:00",
        "estimated": "2024-11-11T10:36:58+00:00"
      },
      "location": {
        "id": 7,
        "type": "STOP_POINT",
        "name": "Rosyth",
        "region_name": "Rosyth",
        "code": "ROS",
        "code_detail": "Rosyth",
        "detailed_name": "St John's & St Columba's Church",
        "lon": -3.415373,
        "lat": 56.036069,
        "google_place_id": "ChIJF1mMfCbOh0gRv2ekZY5TgDU",
        "atco_code": "6500D0254",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 56.03619930007082,
            "longitude": -3.4157851338386536
          },
          {
            "latitude": 56.036094407234714,
            "longitude": -3.4148302674293514
          },
          {
            "latitude": 56.035880624731846,
            "longitude": -3.414908945505886
          },
          {
            "latitude": 56.03599351007766,
            "longitude": -3.41587632894516
          },
          {
            "latitude": 56.03619930007082,
            "longitude": -3.4157851338386536
          }
        ],
        "heading": 90,
        "area_id": 18
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": true
    },
    {
      "id": 1374047,
      "departure": {
        "scheduled": "2024-11-11T10:57:00+00:00",
        "actual": "2024-11-11T10:52:30+00:00",
        "estimated": "2024-11-11T10:57:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T10:57:00+00:00",
        "actual": "2024-11-11T10:51:04+00:00",
        "estimated": "2024-11-11T10:51:10+00:00"
      },
      "location": {
        "id": 25,
        "type": "STOP_POINT",
        "name": "Ingliston P&R",
        "region_name": "Edinburgh",
        "code": "EDI",
        "code_detail": "Ingliston P&R",
        "detailed_name": "Ingliston P&R (Bus Stop)",
        "local_name": "the bus stop",
        "lon": -3.35609,
        "lat": 55.93907,
        "google_place_id": "ChIJiyELPgHFh0gRNQNkuGaZJ3g",
        "atco_code": "6200247604",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 55.93912014254329,
            "longitude": -3.356469869613648
          },
          {
            "latitude": 55.93924833303975,
            "longitude": -3.3559763431549077
          },
          {
            "latitude": 55.93839906325638,
            "longitude": -3.355354070663452
          },
          {
            "latitude": 55.93827087013271,
            "longitude": -3.3558976645872463
          },
          {
            "latitude": 55.93912014254329,
            "longitude": -3.356469869613648
          }
        ],
        "heading": 315,
        "area_id": 45
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374048,
      "departure": {
        "scheduled": "2024-11-11T11:08:00+00:00",
        "actual": "2024-11-11T11:02:55+00:00",
        "estimated": "2024-11-11T11:08:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T11:08:00+00:00",
        "actual": "2024-11-11T11:02:52+00:00",
        "estimated": "2024-11-11T11:04:31+00:00"
      },
      "location": {
        "id": 222,
        "type": "STOP_POINT",
        "name": "Edinburgh Corstorphine",
        "region_name": "Edinburgh",
        "code": "EDI",
        "code_detail": "Corstorphine",
        "detailed_name": "Corstorphine (Eastbound)",
        "lon": -3.287015,
        "lat": 55.943189,
        "google_place_id": "ChIJI_ZdRHnGh0gRTfsgtlM3Jw0",
        "atco_code": "6200202750",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 55.943180546910135,
            "longitude": -3.2871853959568575
          },
          {
            "latitude": 55.94311880319212,
            "longitude": -3.28719410019181
          },
          {
            "latitude": 55.94309768031862,
            "longitude": -3.286903959026711
          },
          {
            "latitude": 55.94316754824084,
            "longitude": -3.2868952547917587
          },
          {
            "latitude": 55.943180546910135,
            "longitude": -3.2871853959568575
          }
        ],
        "heading": 100,
        "area_id": 226
      },
      "allow_boarding": true,
      "allow_drop_off": true,
      "booking_cut_off_mins": 10,
      "pre_booked_only": true,
      "skipped": false
    },
    {
      "id": 1374049,
      "departure": {
        "scheduled": "2024-11-11T11:17:00+00:00",
        "estimated": "2024-11-11T11:17:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T11:17:00+00:00",
        "estimated": "2024-11-11T11:13:50+00:00"
      },
      "location": {
        "id": 85,
        "type": "STOP_POINT",
        "name": "Haymarket (Grosvenor Street)",
        "region_name": "Edinburgh",
        "code": "EDI",
        "code_detail": "Haymarket",
        "detailed_name": "Haymarket (Grosvenor Street)",
        "local_name": "Grosvenor Street",
        "direction": "EASTBOUND",
        "lon": -3.216971199313877,
        "lat": 55.94671166462944,
        "google_place_id": "9590024268481693793",
        "atco_code": "6200202936",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 55.94698758708441,
            "longitude": -3.217106135003217
          },
          {
            "latitude": 55.94676709878082,
            "longitude": -3.2176275960655847
          },
          {
            "latitude": 55.946314199949114,
            "longitude": -3.2170103564407397
          },
          {
            "latitude": 55.9465585276084,
            "longitude": -3.2164569691908804
          },
          {
            "latitude": 55.94698758708441,
            "longitude": -3.217106135003217
          }
        ],
        "heading": 151,
        "area_id": 43
      },
      "stop_replacement": {
        "description": "Due to a road closure your service will call at Haymarket (Grosvenor Street) instead of Haymarket. We're sorry for any inconvenience.",
        "original_location_id": 28,
        "original_location_atco_code": "6200202930",
        "replacement_location_id": 85,
        "use_stop_name": true,
        "is_cancelled": false,
        "arrival_delay": 0
      },
      "allow_boarding": false,
      "allow_drop_off": true,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    },
    {
      "id": 1374050,
      "departure": {
        "scheduled": "2024-11-11T11:28:00+00:00",
        "estimated": "2024-11-11T11:26:00+00:00"
      },
      "arrival": {
        "scheduled": "2024-11-11T11:28:00+00:00",
        "estimated": "2024-11-11T11:26:00+00:00"
      },
      "location": {
        "id": 175,
        "type": "STOP_POINT",
        "name": "George Street",
        "region_name": "Edinburgh",
        "code": "EDI",
        "code_detail": "George Street",
        "detailed_name": "George Street (Stop GL)",
        "lon": -3.19549,
        "lat": 55.95395,
        "google_place_id": "ChIJ1QuappHHh0gRScSpuwtgb-s",
        "atco_code": "6200206490",
        "timezone": "Europe/London",
        "zone": [
          {
            "latitude": 55.953931988302834,
            "longitude": -3.1959008847780765
          },
          {
            "latitude": 55.95377939447385,
            "longitude": -3.1958197713099805
          },
          {
            "latitude": 55.95389942984703,
            "longitude": -3.1951244511562873
          },
          {
            "latitude": 55.954050314770164,
            "longitude": -3.1952101213291244
          },
          {
            "latitude": 55.953931988302834,
            "longitude": -3.1959008847780765
          }
        ],
        "heading": 75,
        "area_id": 42
      },
      "allow_boarding": false,
      "allow_drop_off": true,
      "booking_cut_off_mins": 0,
      "pre_booked_only": false,
      "skipped": false
    }
  ],
  "vehicle": {
    "wheelchair": 1,
    "bicycle": 2,
    "seat": 53,
    "id": 49,
    "plate_number": "SG24 UHU",
    "name": "Yutong Coach (SG24 UHU)",
    "has_wifi": true,
    "has_toilet": true,
    "type": "coach",
    "brand": "Ember",
    "colour": "Black",
    "is_backup_vehicle": false,
    "owner_id": 1,
    "gps": {
      "last_updated": "2024-11-11T11:08:45.215000+00:00",
      "longitude": -3.2377144,
      "latitude": 55.9460383,
      "heading": 77
    },
    "secondary_gps": {
      "last_updated": "2024-11-11T11:12:36.919000+00:00",
      "longitude": -3.2219281610812107,
      "latitude": 55.94780035382013,
      "heading": 58.2171630859375
    }
  },
  "description": {
    "route_number": "E1",
    "pattern_id": 37142,
    "calendar_date": "2024-11-11",
    "type": "public",
    "is_cancelled": false,
    "route_id": 1
  }
}
"""
}
