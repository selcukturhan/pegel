//
//  DataProvider.swift
//  pegel
//
//  Created by user1 on 11.01.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


protocol DataProvider{
    func getStations() -> Array<Station>?
    func getMeasurement(forStation: Station) -> Measurement
}
