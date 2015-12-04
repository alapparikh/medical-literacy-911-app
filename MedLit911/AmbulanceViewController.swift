//
//  AmbulanceViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/3/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit
import MapKit

class AmbulanceViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var ambulanceMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000
    let locationSuggestions = [
        "Starbucks",
        "Empire State Building"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MapKit settings
        let initialLocation = CLLocation(latitude: 40.7127, longitude: -74.0059)
        centerMapOnLocation(initialLocation)
        
        addAnnotation()
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        ambulanceMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return locationSuggestions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // TODO: Change user location pin to new location (defined by selection)
    }
    
    func addAnnotation () {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(40.7127, -74.0059)
        annotation.title = "The Location"
        annotation.subtitle = "This is the location !!!"
        ambulanceMapView.addAnnotation(annotation)
    }
}
