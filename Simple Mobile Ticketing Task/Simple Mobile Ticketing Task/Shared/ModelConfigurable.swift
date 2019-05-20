//
//  ModelConfigurable.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import Foundation

protocol ModelConfigurable {
    associatedtype Model
    
    func configure(with model: Model)
}
