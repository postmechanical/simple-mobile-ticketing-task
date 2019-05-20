//
//  PurchaseViewController.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var purchaseButton: UIButton!
    @IBOutlet var statusLabel: UILabel!
    
    private(set) var model = Purchase(title: "", fare: Fare(duration: "", price: 0.0))
    
    @IBAction func stepperValueChanged(_ sender: Any?) {
        let count = Int(stepper.value)
        countLabel.text = String(count)
        let isPlural = count > 1
        guard let total = NumberFormatter.farePriceFormatter.string(for: model.fare.price * Decimal(count)) else {
            navigationController?.popViewController(animated: true)
            return
        }
        // In a "real" app, we'd use the system localization features to provide localized strings and plurals via Localizable.strings and Localizable.stringsdict
        purchaseButton.setTitle("Buy \(count) ticket\(isPlural ? "s" : "") - \(total)", for: .normal)
    }
    
    @IBAction func purchase(_ sender: Any?) {
        self.statusLabel.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension PurchaseViewController: ModelConfigurable {
    typealias Model = Purchase
    
    func configure(with model: Purchase) {
        loadViewIfNeeded()
        titleLabel.text = model.title
        subtitleLabel.text = model.fare.duration
        self.model = model
        stepperValueChanged(nil)
    }
}
