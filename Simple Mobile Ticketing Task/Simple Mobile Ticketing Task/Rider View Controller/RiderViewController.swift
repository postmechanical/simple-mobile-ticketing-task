//
//  RiderViewController.swift
//  Simple Mobile Ticketing Task
//
//  Created by Aaron London on 5/20/19.
//  Copyright © 2019 postmechanical, LLC. All rights reserved.
//

import UIKit

class RiderViewController: UITableViewController {
    var riderFares = [RiderFares]()

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRiderFares()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showFares",
            let vc = segue.destination as? FareViewController,
            let riderFares = sender as? RiderFares
            else { return }
        vc.riderFares = riderFares
    }

    // MARK: Table view data source & delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riderFares.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: RiderCell.self)
        guard
            indexPath.row < riderFares.count,
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? RiderCell else {
            fatalError("Could not dequeue cell with identifier \(identifier) for indexPath \(indexPath)")
        }
        cell.configure(with: riderFares[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < riderFares.count else { return }
        performSegue(withIdentifier: "showFares", sender: riderFares[indexPath.row])
    }
}

// MARK: Setup

extension RiderViewController {
    func setUpRiderFares() {
        // In a "real" app, we'd fire off an async network request via an API client or `NSURLSessionDataTask` and update UI accordingly upon completion.
        guard
            let url = Bundle.main.url(forResource: "fares-response", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let riderFaresResponse = try? JSONDecoder().decode(RiderFaresResponse.self, from: data)
            else { return }
        riderFares = riderFaresResponse.riderFares
    }
}
