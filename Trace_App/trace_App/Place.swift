//
//  Place.swift
//  trace_App
//
//  Created by Michael Joseph on 27/06/2019.
//  Copyright © 2019 Michael Joseph. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var numberOfPeople: Int
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, numberOfPeople: Int){
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.numberOfPeople = numberOfPeople
        
        super.init()
        
    }
    
    var subtitle: String?{
        return locationName
    }
    
}
