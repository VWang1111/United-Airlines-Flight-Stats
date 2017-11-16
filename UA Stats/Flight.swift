//
//  Flight.swift
//  UA Stats
//
//  Created by Victor Wang on 10/27/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Foundation

struct Flight : CustomStringConvertible{
    var PQM = 0
    var PQD = 0
    var LifetimeMiles = 0
    var PremiumCabin = false
    var Upgraded = false
    
    static let FullFarePremiumClasses = ["F","J"]
    static let PremiumFareClasses = ["A","C","D","Z","P"]
    static let FullFareEconomyClasses = ["Y", "B"]
    
    init(fromFlightNum flightNum: String, fromPQM rawPQM: String, fromPQD pQD: String){
        let pQM = rawPQM.replacingOccurrences(of: ",", with: "")
        
        let range = flightNum.range(of: "(?<=-)[^ ]+(?= )", options: .regularExpression)
        if(range != nil){
            let fareClass = flightNum.substring(with: range!)
            if(fareClass.characters.count > 1){
                Upgraded = true
                PremiumCabin = true
                PQM = Int(pQM)!
                LifetimeMiles = PQM
            }
            else{
                if(Flight.FullFarePremiumClasses.contains(fareClass)){
                    PremiumCabin = true
                    PQM = Int(pQM)!
                    LifetimeMiles = PQM/3
                }
                else if(Flight.PremiumFareClasses.contains(fareClass)){
                    PremiumCabin = true
                    PQM = Int(pQM)!
                    LifetimeMiles = PQM/3
                }
                else if(Flight.FullFareEconomyClasses.contains(fareClass)){
                    PremiumCabin = true
                    PQM = Int(pQM)!
                    LifetimeMiles = Int((Double(PQM))/1.5)
                }
                else{
                    PQM = Int(pQM)!
                    LifetimeMiles = PQM
                }
                
            }
            
            let start = pQD.index(after: pQD.startIndex)
            let pqdTest = Int(pQD.substring(from: start).replacingOccurrences(of: ",", with: ""))
            PQD = pqdTest != nil ? pqdTest! : 0
        }
    }
    
    var description: String{
        return "PQM: \(PQM), PQD: \(PQD), Lifetime Miles: \(LifetimeMiles), Premium Cabin: \(PremiumCabin), Upgraded: \(Upgraded)"
    }
}
