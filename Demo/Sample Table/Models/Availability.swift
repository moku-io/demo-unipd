//
//  Availability.swift
//  Demo
//
//  Created by Davide Castello on 13/11/2019.
//  Copyright © 2019 Moku Srl. All rights reserved.
//

import Foundation

public struct Availability {
  
  public var availabilityId: Int
  public var date: Date
  
  init(availabilityId: Int, date: Date) {
    self.availabilityId = availabilityId
    self.date = date
  }
}
