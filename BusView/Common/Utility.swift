//
//  Utility.swift
//  BusView
//
//  Created by Catherine Megregian on 11/11/2024.
//

import Foundation

extension Date {
    func shortenedTime() -> String {
        formatted(date: .omitted, time: .shortened)
    }
}

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}
