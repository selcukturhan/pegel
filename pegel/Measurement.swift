//
//  Measurement.swift
//  pegel
//
//  Created by user1 on 11.01.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class Measurement{
    let timestamp: Date
    let value: Double
    
    init(timestamp: Date, value: Double) {
        self.timestamp = timestamp
        self.value = value
    }
    
}
