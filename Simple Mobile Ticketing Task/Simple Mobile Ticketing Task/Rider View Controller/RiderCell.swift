//
//  RiderCell.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import UIKit

class RiderCell: UITableViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        detailTextLabel?.text = nil
    }
}

extension RiderCell: ModelConfigurable {
    typealias Model = RiderFares
    func configure(with model: RiderFares) {
        textLabel?.text = model.title
        detailTextLabel?.text = model.subtitle
    }
}
