//
//  Fares.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import Foundation

struct AnyCodingKey: CodingKey {
    var stringValue: String
    var intValue: Int? {
        return nil
    }
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        return nil
    }
}

enum NestedKeys: String, CodingKey {
    case fares
    case subtitle = "subtext"
}

enum Rider: String, CaseIterable {
    case Adult
    case Child
    case Senior
}

struct RiderFares: Decodable, Equatable {
    let title: String
    let subtitle: String?
    let fares: [Fare]
}

struct Fare: Decodable, Equatable {
    let duration: String
    let price: Decimal
    
    enum CodingKeys: String, CodingKey {
        case duration = "description" // Renamed because `description` is a reserved word in several Swift protocols in play here.
        case price
    }
}

struct RiderFaresResponse: Decodable {
    let riderFares: [RiderFares]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        var allRiderFares = [RiderFares]()
        for rider in Rider.allCases {
            let riderKey = AnyCodingKey(stringValue: rider.rawValue)!
            let nestedContainer = try container.nestedContainer(keyedBy: NestedKeys.self, forKey: riderKey)
            let subtitle = try? nestedContainer.decode(String.self, forKey: NestedKeys.subtitle)
            let fares = try nestedContainer.decode([Fare].self, forKey: NestedKeys.fares)
            let riderFares = RiderFares(title: rider.rawValue, subtitle: subtitle, fares: fares)
            allRiderFares.append(riderFares)
        }
        self.riderFares = allRiderFares
    }
}
