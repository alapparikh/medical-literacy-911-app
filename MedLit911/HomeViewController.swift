//
//  HomeViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 11/23/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onEmergencyButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("showAssessmentScreen", sender: nil)
    }

}
