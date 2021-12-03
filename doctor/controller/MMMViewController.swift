//
//  MMMViewController.swift
//  doctor
//
//  Created by SAMIR OUNIFI on 30/11/2021.
//
import CoreLocation
import UIKit
import GoogleMaps
class MMMViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet var mymap: GMSMapView!
    let locationmanager = CLLocationManager()
       override func viewDidLoad() {
           super.viewDidLoad()


           locationmanager.delegate=self
           
           if CLLocationManager.locationServicesEnabled(){
               
               locationmanager.requestLocation()
               
           }else{
               
               locationmanager.requestWhenInUseAuthorization()
               
           }
           
           

       }
       
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           mymap.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: locationmanager.location?.coordinate.latitude ?? 0.0, longitude: locationmanager.location?.coordinate.longitude ?? 0.0), zoom: 4, bearing: 2, viewingAngle: 2)
           
           let marker = GMSMarker()
           marker.position = CLLocationCoordinate2D(latitude: locationmanager.location?.coordinate.latitude ?? 0.0,longitude: locationmanager.location?.coordinate.longitude ?? 0.0)
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
