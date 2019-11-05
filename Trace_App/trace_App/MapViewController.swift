//
//  MapViewController.swift
//  trace_App
//
//  Created by Michael Joseph on 27/06/2019.
//  Copyright © 2019 Michael Joseph. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var places: [Place] = []
    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        mapView.delegate = self
        configureLocationServices()
        
        print(places)
    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1_000, longitudinalMeters: 1_000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    
    private func addAnnotations() {
        
        
        for place in places {
            let annotation  = MKPointAnnotation()
            annotation.title = place.title
            annotation.subtitle = place.locationName
            annotation.coordinate = place.coordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    
    
    
    
    @IBAction func currentLocation(_ sender: Any) {
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
    }
}


extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
            addAnnotations()
        }
        
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        
        if let title = annotation.subtitle, title == "Parc" {
            annotationView?.image = UIImage(named: "running1")
        } else if let title = annotation.subtitle, title == "Terrain" {
            annotationView?.image = UIImage(named: "basket1")
        } else if let title = annotation.subtitle, title == "Stade"{
            annotationView?.image = UIImage(named: "football1")
        } else if annotation === mapView.userLocation {
            annotationView?.image = UIImage(named: "leader")
        }
        
        annotationView?.canShowCallout = true
        annotationView?.calloutOffset = CGPoint(x: -5, y: 5 )
        //annotationView?.rightCalloutAccessoryView = UIButton(type: .contactAdd)
        let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                size: CGSize(width: 50, height: 50)))
        mapsButton.setBackgroundImage(UIImage(named: "icon"), for: UIControl.State())
        annotationView?.rightCalloutAccessoryView = mapsButton
    
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("The annotation was selected: \(String(describing: view.annotation?.title))")
        
        let placeMatched = places.filter { $0.title ==  view.annotation?.title }.first
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "RdvVC") as! ScroolViewController2
        vc.place = placeMatched
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

