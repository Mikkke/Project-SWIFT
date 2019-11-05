//
//  ViewController.swift
//  trace_App
//
//  Created by Michael Joseph on 20/06/2019.
//  Copyright © 2019 Michael Joseph. All rights reserved.
//

import UIKit

extension UITextField{
    
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buttonCornerRadius: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //buttonCornerRadius.layer.cornerRadius = 100
        //buttonCornerRadius.clipsToBounds = true
    
        self.nameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
       buttonCornerRadius.layer.shadowColor = UIColor.black.cgColor
        buttonCornerRadius.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        buttonCornerRadius.layer.masksToBounds = false
        buttonCornerRadius.layer.shadowRadius = 1.0
        buttonCornerRadius.layer.shadowOpacity = 0.5
        buttonCornerRadius.layer.cornerRadius = buttonCornerRadius.frame.width / 2
        
        nameTextField.underlined()
        passwordTextField.underlined()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : ViewController2 = segue.destination as! ViewController2
        destViewController.Label = nameTextField.text?
    }*/

    @IBAction func goButton(_ sender: Any) {
        //let nametext = nameTextField.text
    }
    
    
}

