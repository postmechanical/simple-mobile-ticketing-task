//
//  FareViewController.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import UIKit

class FareViewController: UITableViewController {
    
    var riderFares = RiderFares(title: "", subtitle: nil, fares: [])
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = riderFares.title
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: handle setup of `PurchaseViewController`
    }

    // MARK: Table view data source & delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riderFares.fares.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: FareCell.self)
        guard
            indexPath.row < riderFares.fares.count,
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? FareCell else {
                fatalError("Could not dequeue cell with identifier \(identifier) for indexPath \(indexPath)")
        }
        cell.configure(with: riderFares.fares[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < riderFares.fares.count else { return }
        performSegue(withIdentifier: "showPurchase", sender: riderFares.fares[indexPath.row])
    }

}
