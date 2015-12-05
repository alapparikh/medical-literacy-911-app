//
//  AmbulanceViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/3/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit
import MapKit

class AmbulanceViewController: UIViewController, UIPickerViewDelegate, MKMapViewDelegate {
    
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
        
        // Annotation settings
        let userLocation = CustomPointAnnotation()
        userLocation.coordinate = CLLocationCoordinate2DMake(40.7137, -74.0059)
        userLocation.title = "Your Location"
        userLocation.subtitle = "Your current estimated location"
        userLocation.imageName = "1.png"
        
        let ambulanceLocation = CustomPointAnnotation()
        ambulanceLocation.coordinate = CLLocationCoordinate2DMake(40.7147, -74.0059)
        ambulanceLocation.title = "Ambulance location"
        ambulanceLocation.subtitle = "Last known ambulance location"
        ambulanceLocation.imageName = "2.png"
        
        let hospitalLocation = CustomPointAnnotation()
        hospitalLocation.coordinate = CLLocationCoordinate2DMake(40.7117, -74.0059)
        hospitalLocation.title = "Hospital location"
        hospitalLocation.subtitle = "Closest hospital location"
        hospitalLocation.imageName = "2.png"
        
        
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
    
    // MapView Delegate
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        }
        else {
            anView!.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        let cpa = annotation as! CustomPointAnnotation
        anView!.image = UIImage(named:cpa.imageName)
        
        return anView
    }
}
