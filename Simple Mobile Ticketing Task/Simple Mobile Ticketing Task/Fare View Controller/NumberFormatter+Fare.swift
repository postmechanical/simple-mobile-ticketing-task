//
//  NumberFormatter+Fare.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static var farePriceFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
}
