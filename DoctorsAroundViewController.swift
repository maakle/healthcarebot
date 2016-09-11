//
//  DoctorsAroundViewController.swift
//  healthcarebot
//
//  Created by Mathias Klenk on 11/09/16.
//  Copyright © 2016 Mathias Klenk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DoctorsAroundViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    //Outlets
    @IBOutlet weak var map: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            map.showsUserLocation = true

        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        self.map.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
}

