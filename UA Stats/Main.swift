//
//  Main.swift
//  UA Stats
//
//  Created by Victor Wang on 10/27/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Foundation

class Main{
    
    static var totalFlights = 0
    static var totalPQM = 0
    static var totalLifetimeMiles = 0
    static var totalCPM = 0.0
    
    static var totalUpgradedFlights = 0
    static var totalUpgradePercentage = 0.0
    
    static var milesPremiumCabin = 0
    static var milesEconomyCabin = 0
    static var percentagePremiumEconomy = 0.0
    
    static var allFlights = [Flight]()
    
    static func updateStatistics(rawTextStr : String){
        if(rawTextStr == ""){
            return
        }
        resetAllStats()
        
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
        
        updateTotalStatistics()
    }
    
    static func updateTotalStatistics(){
        totalFlights = allFlights.count
        var totalCost = 0.0
        
        for flight in allFlights{
            totalPQM += flight.PQM
            totalLifetimeMiles += flight.LifetimeMiles
            totalCost += Double(flight.PQD)
            
            if(flight.Upgraded){
                totalUpgradedFlights += 1
            }
            
            if(flight.PremiumCabin){
                milesPremiumCabin += flight.LifetimeMiles
            }
            else{
                milesEconomyCabin += flight.LifetimeMiles
            }
        }
        
        totalCPM = totalCost/Double(totalPQM)
        totalUpgradePercentage = Double(totalUpgradedFlights)/Double(totalFlights)
        percentagePremiumEconomy = Double(milesPremiumCabin)/Double(totalLifetimeMiles)
    }
    
    static func resetAllStats(){
        totalFlights = 0
        totalPQM = 0
        totalLifetimeMiles = 0
        totalCPM = 0.0
        
        totalUpgradedFlights = 0
        totalUpgradePercentage = 0.0
        
        milesPremiumCabin = 0
        milesEconomyCabin = 0
        percentagePremiumEconomy = 0.0
        
        allFlights.removeAll()
    }
    
}
