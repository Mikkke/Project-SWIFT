//
//  ScroolViewController2.swift
//  trace_App
//
//  Created by Michael Joseph on 24/06/2019.
//  Copyright © 2019 Michael Joseph. All rights reserved.
//

import Foundation
import UIKit


class ScroolViewController2: UIViewController {
    
    
    @IBOutlet weak var datePickerView: UIPickerView!
    @IBOutlet weak var hoursPickerView: UIPickerView!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var titreLieux: UILabel!
    
    
    var place: Place?
    var dateModelPicker: DateModelPicker!
    var hoursModelPicker: HoursModelPickers!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //titreLieux.text = place?.title
        //print("PLACE A AFFICHER PAR MASSI")
        //print(place?.title)
        
        dateModelPicker = DateModelPicker()
        dateModelPicker.modelData = Data.getData()
        
        datePickerView.dataSource = dateModelPicker
        datePickerView.delegate = dateModelPicker
        
        hoursModelPicker = HoursModelPickers()
        hoursModelPicker.modelHours = DataHours.getHours()
        
        hoursPickerView.dataSource = hoursModelPicker
        hoursPickerView.delegate = hoursModelPicker
        
    }
    
    
}

