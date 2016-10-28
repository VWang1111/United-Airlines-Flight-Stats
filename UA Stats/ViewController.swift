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
        
        if(rawTextField != nil){
            Main.updateStatistics(rawTextStr: rawTextField.stringValue)
        }
        
        if(totalFlights != nil){
            //update strings with values
        }

    }
    
    func updateStatistics() {
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

