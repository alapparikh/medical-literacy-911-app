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
        
        // Status bar white font
        navigationController!.navigationBar.barTintColor = UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1.0)
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    @IBAction func onEmergencyButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("showAssessmentScreen", sender: nil)
    }

}
