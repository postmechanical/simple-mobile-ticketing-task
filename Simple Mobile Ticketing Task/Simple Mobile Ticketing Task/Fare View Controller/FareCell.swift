//
//  FareCell.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import UIKit

class FareCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        detailTextLabel?.text = nil
    }
}

extension FareCell: ModelConfigurable {
    typealias Model = Fare
    
    func configure(with model: Fare) {
        textLabel?.text = model.duration
        detailTextLabel?.text = NumberFormatter.farePriceFormatter.string(for: model.price)
    }
}
