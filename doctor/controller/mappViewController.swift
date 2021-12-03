//
//  mappViewController.swift
//  doctor
//
//  Created by SAMIR OUNIFI on 30/11/2021.
//

import UIKit
import GoogleMaps

class MAPViewController: UIViewController, CLLocationManagerDelegate {

    
    
    @IBOutlet weak var mymap: GMSMapView!
    
    let locationmanager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()


        locationmanager.delegate = self
        
        if CLLocationManager.locationServicesEnabled(){
            
            locationmanager.requestLocation()
            
        }else{
            
            locationmanager.requestWhenInUseAuthorization()
            
        }
        
        
        

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        mymap.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: locationmanager.location?.altitude ?? 0.0, longitude: locationmanager.location?.altitude ?? 0.0), zoom: 8, bearing: 0, viewingAngle: 0)
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationmanager.location?.altitude ?? 0.0,longitude: locationmanager.location?.altitude ?? 0.0)
        marker.title = "tunisie"
        marker.snippet = "tunis"
        marker.map = mymap
        print("License: \n\n\(GMSServices.openSourceLicenseInfo())")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            return
        case .authorizedWhenInUse:
            return
        case .denied:
            return
        case .restricted:
            locationmanager.requestWhenInUseAuthorization()
        case .notDetermined:
            locationmanager.requestWhenInUseAuthorization()
        default:
            locationmanager.requestWhenInUseAuthorization()

        }
    }
 
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}
