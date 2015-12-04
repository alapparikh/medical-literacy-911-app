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
    
    @IBOutlet weak var homeMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MapKit settings
        let initialLocation = CLLocation(latitude: 40.732207, longitude: -73.992601)
        centerMapOnLocation(initialLocation)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        homeMapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func onEmergencyButtonPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("showAssessmentScreen", sender: nil)
    }

}
