//
//  ConnectingViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/3/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit

class ConnectingViewController: UIViewController {
    
    @IBOutlet weak var dotsLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = NSTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
    }
    
    func countUp() {
        
        count += 1
        if (count == 10) {
            // Perform segue to 'help is on the way' screen
            performSegueWithIdentifier("showAmbulanceScreen", sender: nil)
        }
        
        var text = ""
        for var i=0; i<(count%3); i++ {
            text += "."
        }
        dotsLabel.text = text
    }

}
