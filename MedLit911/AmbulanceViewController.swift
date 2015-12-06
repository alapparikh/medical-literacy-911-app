//
//  AmbulanceViewController.swift
//  MedLit911
//
//  Created by Alap Parikh on 12/3/15.
//  Copyright © 2015 Alap Parikh. All rights reserved.
//

import UIKit
import MapKit

class AmbulanceViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var ambulanceMapView: MKMapView!
    let regionRadius: CLLocationDistance = 1500
    let locationSuggestions = [
        "Starbucks",
        "Empire State Building"
    ]
    var annotationArray = [CustomPointAnnotation]()
    let userLocation = CustomPointAnnotation()
    let ambulanceLocation = CustomPointAnnotation()
    let hospitalLocation = CustomPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MapKit settings
        ambulanceMapView.delegate = self
        let initialLocation = CLLocation(latitude: 40.756581, longitude: -73.967662)
        centerMapOnLocation(initialLocation)
        
        // Annotation settings
        
        userLocation.coordinate = CLLocationCoordinate2DMake(40.756581, -73.967662)
        userLocation.title = "Your Location"
        userLocation.subtitle = "Your current estimated location"
        userLocation.imageName = "marker"
        
        ambulanceLocation.coordinate = CLLocationCoordinate2DMake(40.764870, -73.961289)
        ambulanceLocation.title = "Ambulance location"
        ambulanceLocation.subtitle = "Last known ambulance location"
        ambulanceLocation.imageName = "car"
        
        hospitalLocation.coordinate = CLLocationCoordinate2DMake(40.764639, -73.954853)
        hospitalLocation.title = "Hospital location"
        hospitalLocation.subtitle = "Closest hospital location"
        hospitalLocation.imageName = "hospital"
        
        annotationArray.append(hospitalLocation)
        annotationArray.append(ambulanceLocation)
        annotationArray.append(userLocation)
        
        ambulanceMapView.addAnnotations(annotationArray)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        ambulanceMapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MapView Delegate
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
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
        print(cpa.title)

        let imageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
        imageView.image = UIImage(named: cpa.imageName);
        //imageView.layer.cornerRadius = imageView.layer.frame.size.width / 2
        imageView.layer.masksToBounds = true
        anView!.addSubview(imageView)
        
        return anView
    }
    
    // Select different location
     @IBAction func onEditLocationButtonPressed(sender: AnyObject) {
        
        // TODO: focus map on preselected location
        let walgreensLocation = CLLocation(latitude: 40.756448, longitude: -73.967107)
        centerMapOnLocation(walgreensLocation)
        userLocation.coordinate = CLLocationCoordinate2DMake(40.756448, -73.967107)
        
        performSegueWithIdentifier("pickLocationSegue", sender: nil)
    }
}
