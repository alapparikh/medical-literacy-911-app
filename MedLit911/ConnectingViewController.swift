//
//  ConnectingViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/3/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit

class ConnectingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)    }

}
