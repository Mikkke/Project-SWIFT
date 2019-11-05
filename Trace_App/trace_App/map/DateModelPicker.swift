//
//  DateModelPicker.swift
//  datePIckerTest
//
//  Created by Massi Bennai on 21/06/2019.
//  Copyright © 2019 M10 corps. All rights reserved.
//

import UIKit

class DateModelPicker: UIPickerView {
    
    var modelData: [DateModel]!
    var customHeight: CGFloat = 40
    var customWidth: CGFloat = 200
}

extension DateModelPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelData.count
    }
}

extension DateModelPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return customHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: customWidth, height: customHeight))

        let dayLabel = UILabel(frame: CGRect(x: 0, y: 10, width: customWidth, height: 15))
        dayLabel.text = modelData[row].day
        dayLabel.textColor = UIColor.white
        dayLabel.textAlignment = .center
        dayLabel.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        view.addSubview(dayLabel)

        return view

    }
}
