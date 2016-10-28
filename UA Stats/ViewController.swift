//
//  ViewController.swift
//  UA Stats
//
//  Created by Victor Wang on 10/24/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var rawTextField: NSTextField!
    @IBOutlet weak var totalFlights: NSTextField!
    @IBOutlet weak var totalPQM: NSTextField!
    @IBOutlet weak var totalLifetimeMiles: NSTextField!
    @IBOutlet weak var totalCPM: NSTextField!
    @IBOutlet weak var numUpradedFlights: NSTextField!
    @IBOutlet weak var upgradedFlightPercentage: NSTextField!
    @IBOutlet weak var milesEarnedPremiumCabin: NSTextField!
    @IBOutlet weak var milesEarnedEconomyCabin: NSTextField!
    @IBOutlet weak var percentagePremiumEconomy: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        
        let frame = NSApplication.shared().windows[0]
        frame.title = "UA Statistics"
        
        if(totalFlights != nil){
            //update strings with values
            totalFlights.stringValue = String(Main.totalFlights)
            totalPQM.stringValue = String(Main.totalPQM)
            totalLifetimeMiles.stringValue = String(Main.totalLifetimeMiles)
            totalCPM.stringValue = String(format: "%.1f", Main.totalCPM*100) + "\u{00A2}"
            
            numUpradedFlights.stringValue = String(Main.totalUpgradedFlights)
            upgradedFlightPercentage.stringValue = String(format: "%2.f", Main.totalUpgradePercentage*100) + "%"
            
            milesEarnedPremiumCabin.stringValue = String(Main.milesPremiumCabin)
            milesEarnedEconomyCabin.stringValue = String(Main.milesEconomyCabin)
            percentagePremiumEconomy.stringValue = String(format: "%2.0f", Main.percentagePremiumEconomy*100) + "%"
        }

    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSTextViewDelegate{
    override func controlTextDidEndEditing(_ obj: Notification) {
        Main.updateStatistics(rawTextStr: rawTextField.stringValue)
    }
}
