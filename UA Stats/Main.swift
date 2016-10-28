//
//  Main.swift
//  UA Stats
//
//  Created by Victor Wang on 10/27/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Foundation

class Main{
    
    var totalFlights = 0
    var totalPQM = 0
    var totalLifetimeMiles = 0
    var totalCPM = 0.0
    
    var totalUpgradedFlights = 0
    var totalUpgradePercentage = 0
    
    var milesPremiumCabin = 0
    var milesEconomyCabin = 0
    var percentagePremiumEconomy = 0
    
    static var allFlights = [Flight]()
    
    static func updateStatistics(rawTextStr : String){
        if(rawTextStr == ""){
            return
        }
        
        let allFlightStrArr = rawTextStr.components(separatedBy: "\n")
        
        for i in stride(from: 0, to: allFlightStrArr.count, by:2){
            let flightNum = allFlightStrArr[i]
            let flightDescriptionArr = flightNum.components(separatedBy: "\t")
            let flightDescription = flightDescriptionArr[1]
            
            //not a united flight
            if(flightDescription[flightDescription.startIndex] != "U"){
                continue
            }
                
            //this is a united flight
            else{
                let fullDetailStr = allFlightStrArr[i+1]
                let fullDetailStrArr = fullDetailStr.components(separatedBy: "\t")
                let PQM = fullDetailStrArr[6]
                let PQD = fullDetailStrArr[8]

                Main.allFlights.append(Flight(fromFlightNum: flightDescription,fromPQM: PQM,fromPQD: PQD))
                
                //print(Main.allFlights)
            }
        }
    }
    
    
    
}
