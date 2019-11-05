//
//  DataBase.swift
//  datePIckerTest
//
//  Created by Massi Bennai on 21/06/2019.
//  Copyright © 2019 M10 corps. All rights reserved.
//

import Foundation

class Data {
    
    class func getData() -> [DateModel] {
        var data = [DateModel]()
        
        data.append(DateModel(day: "Mercredi 03 Juillet"))
        data.append(DateModel(day: "Vendredi 05 Juillet"))
        data.append(DateModel(day: "Samedi 06 Juillet"))
        data.append(DateModel(day: "Dimanche 07 Juillet"))
        
        return data
    }
}
    class DataHours {
        
    
    class func getHours() -> [HoursModel] {
        var hour = [HoursModel]()
        
        hour.append(HoursModel(hours: "15h00"))
        hour.append(HoursModel(hours: "18h00"))
        hour.append(HoursModel(hours: "19h00"))
        hour.append(HoursModel(hours: "20h00"))
        
        
return hour
        }
    }


