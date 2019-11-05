//
//  ViewController2.swift
//  trace_App
//
//  Created by Michael Joseph on 25/06/2019.
//  Copyright © 2019 Michael Joseph. All rights reserved.
//

import UIKit
import MapKit

class ViewController2: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
     var allPlaces: [Place] = []
    //var Label = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allPlaces.append(Place(title: "Stade du moulin neuf", locationName: "Stade", discipline: "FOOTBALL", coordinate: CLLocationCoordinate2DMake(48.936346, 2.505448), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Parc departemental du sausset", locationName: "Parc", discipline: "RUNNING", coordinate: CLLocationCoordinate2DMake(48.960673, 2.503069), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Parc Robert Ballanger", locationName: "Parc", discipline: "RUNNING", coordinate: CLLocationCoordinate2DMake(48.957281, 2.486616), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Gymnase Cosec Rose des vent", locationName: "Terrain", discipline: "BASKET", coordinate: CLLocationCoordinate2DMake(48.959587, 2.496776), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Stade du velodrome", locationName: "Stade", discipline: "FOOTBALL", coordinate: CLLocationCoordinate2DMake(48.949968, 2.505485), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Stade Belval", locationName: "Terrain", discipline: "BASKET", coordinate: CLLocationCoordinate2DMake(48.940126, 2.481759), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Gymnase Pierre Scohy", locationName: "Terrain", discipline: "BASKET", coordinate: CLLocationCoordinate2DMake(48.939820, 2.496288), numberOfPeople: 10))
        
         allPlaces.append(Place(title: "Gymnase", locationName: "Terrain", discipline: "BASKET", coordinate: CLLocationCoordinate2DMake(48.945360, 2.507693), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Parc du clos", locationName: "Parc", discipline: "RUNNING", coordinate: CLLocationCoordinate2DMake(48.943852, 2.487572), numberOfPeople: 10))
        
        allPlaces.append(Place(title: "Stade de Coursaille", locationName: "Stade", discipline: "FOOTBALL", coordinate: CLLocationCoordinate2DMake(48.944280, 2.487935), numberOfPeople: 10))
        
         allPlaces.append(Place(title: "City August Renoir", locationName: "Stade", discipline: "FOOTBALL", coordinate: CLLocationCoordinate2DMake(48.9522, 2.4913), numberOfPeople: 10))
        
        
       // welcomeLabel.text = Label
       
        
    }
    
    
    
    @IBAction func footBallButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        
        vc.places = allPlaces.filter { $0.discipline == "FOOTBALL" }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func runningButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        
        vc.places = allPlaces.filter { $0.discipline == "RUNNING" }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func basketButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        
        vc.places = allPlaces.filter { $0.discipline == "BASKET" }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
