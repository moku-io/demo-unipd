//
//  SampleTableViewController.swift
//  Demo
//
//  Created by Davide Castello on 13/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import UIKit

class SampleTableViewController: UITableViewController {
  
  var availabilities: [Availability] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateAvailabilities()
  }
  
  func updateAvailabilities() {
    availabilities = []
    var index = 1
    let today = Date()
    while (availabilities.count < 15) {
      availabilities.append(Availability(availabilityId: index, date: today.dateByAdding(days: index)))
      index += Int.random(in: 1...3)
    }
    tableView.reloadData()
  }
  
  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return availabilities.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCardIdentifier", for: indexPath) as! SampleTableViewCell
    let index = indexPath.row
    if (availabilities.count > index) {
      let current = availabilities[index]
      cell.setupWithAvailability(current)
      cell.containerViewTopConstraint.constant = isFirst(current) ? 16.0 : 8.0
      cell.containerViewBottomConstraint.constant = isLast(current) ? 16.0 : 8.0
    }
    return cell
  }
  
  func isFirst(_ availability: Availability) -> Bool {
    return availabilities.first?.availabilityId == availability.availabilityId
  }
  
  func isLast(_ availability: Availability) -> Bool {
    return availabilities.last?.availabilityId == availability.availabilityId
  }
}
