//
//  HoursModelPickers.swift
//  datePIckerTest
//
//  Created by Massi Bennai on 22/06/2019.
//  Copyright © 2019 M10 corps. All rights reserved.
//

import UIKit

class HoursModelPickers: UIPickerView {
    
    var modelHours: [HoursModel]!
    var customHeight: CGFloat = 40
    var customWidth: CGFloat = 100
    
}
extension HoursModelPickers: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelHours.count
    }
}

extension HoursModelPickers: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        
        let hoursLabel = UILabel(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))
        
        
        hoursLabel.text = modelHours[row].hours
        hoursLabel.textColor = UIColor.white
        hoursLabel.textAlignment = .center
        hoursLabel.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        view.addSubview(hoursLabel)
        return view
        
    }
    
}
