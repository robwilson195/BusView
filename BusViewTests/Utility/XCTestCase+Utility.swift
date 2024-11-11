//
//  XCTestCase+Utility.swift
//  BusViewTests
//
//  Created by Catherine Megregian on 11/11/2024.
//

import XCTest

extension XCTestCase {
    func eleventhNovemberDateFrom(hour: Int, minute: Int) -> Date {
        var components = DateComponents()
        components.year = 2024
        components.month = 11
        components.day = 11
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components)!
    }
}
