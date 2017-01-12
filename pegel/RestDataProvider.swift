//
//  RestDataProvider.swift
//  pegel
//
//  Created by user1 on 11.01.17.
//  Copyright © 2017 mac. All rights reserved.
//

import Foundation


class RestDataProvider : DataProvider{
    
    
    
    func getStations() -> Array<Station>?{
        
        var stations : [Station]
        stations = Array()
        let url:URL! = URL(string: "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations.json")
        do {
            let contents = try Data(contentsOf: url)
            if let array = try JSONSerialization.jsonObject(with: contents, options: .mutableContainers) as? Array<Any>{
                for stationElement in array{
                    
                    var newStation = Station()
                    var station: Dictionary<String, Any>? = stationElement as? Dictionary<String, Any>
                    
                    if let number = Int(station!["number"] as! String) {
                        newStation.number = number
                    }
                    
                    if let name = station!["shortname"] as! String?{
                        newStation.name = name.capitalized
                    }
                    
                    if let agency = station!["agency"] as! String?{
                        newStation.agency = agency
                    }
                    
                    if let longitude = station!["longitude"] as! Double?{
                        newStation.longitude = longitude
                    }
                    
                    if let latitude = station!["latitude"] as! Double?{
                        newStation.latitude = latitude
                    }

                    if let water = station!["water"] as! Dictionary<String, String>?{
                        newStation.water = (water["shortname"] as String?)?.capitalized
                    }

                    stations.append(newStation)
                }
            }
            
        } catch {
            print("Error")
        }

        return stations
    }
    
    func getMeasurement(forStation: Station) -> Measurement {
        let stationName: String? = forStation.name
        let url:URL! = URL(string: "https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/\(stationName)/W/currentmeasurement.json")
        do {
            let contents = try Data(contentsOf: url)
            print(contents)
        } catch {
       
        }
        return Measurement(timestamp: Date(), value:2.3)
    }
    
}
