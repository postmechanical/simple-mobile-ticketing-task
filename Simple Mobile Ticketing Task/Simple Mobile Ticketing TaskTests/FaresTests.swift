//
//  FaresTests.swift
//  Simple Mobile Ticketing TaskTests
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import XCTest
@testable import Simple_Mobile_Ticketing_Task

class FaresTests: XCTestCase {

    func testDecodeSuccess() throws {
        let url = Bundle.main.url(forResource: "fares-response", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let riderFaresResponse = try JSONDecoder().decode(RiderFaresResponse.self, from: data)
        let expectedRiderFares = [
            RiderFares(title: "Adult", subtitle: nil, fares: [
                Fare(duration: "2.5 Hour Ticket", price: 2.5),
                Fare(duration: "1 Day Pass", price: 5.0),
                Fare(duration: "30 Day Pass", price: 100)
                ]),
            RiderFares(title: "Child", subtitle: "Ages 8-17", fares: [
                Fare(duration: "2.5 Hour Ticket", price: 1.5),
                Fare(duration: "1 Day Pass", price: 2.0),
                Fare(duration: "30 Day Pass", price: 40.0)
                ]),
            RiderFares(title: "Senior", subtitle: "Ages 60+", fares: [
                Fare(duration: "2.5 Hour Ticket", price: 1.0),
                Fare(duration: "1 Day Pass", price: 2.0),
                Fare(duration: "30 Day Pass", price: 40.0)
                ])
        ]
        XCTAssertEqual(riderFaresResponse.riderFares, expectedRiderFares)
    }
    
    func testDecodeFailure() {
        let data = """
{
    "Octogenerians": {
        "fares": [
            { "description": "2.5 Hour Ticket", "price": "free" },
            { "description": "1 Day Pass", "price": "free" },
            { "description": "30 Day Pass", "price": "free" }
        ],
        "subtext": "Senior+ they've earned it!"
    }
}
""".data(using: .utf8)!
        do {
            _ = try JSONDecoder().decode(RiderFaresResponse.self, from: data)
            XCTFail("Should not decode invalid response")
        } catch {
            XCTAssertTrue(error is DecodingError)
        }
    }

}
