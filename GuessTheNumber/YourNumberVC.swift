//
//  YourNumberVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class YourNumberVC: UIViewController {
    @IBOutlet weak var enterTheNumberButton: UIButton!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var enterTheNumberPressed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldChanged()
        enterTheNumberButton.layer.cornerRadius = 15
        //enterTheNumberButton.isEnabled = false
        //enterTheNumberButton.alpha = 0.7
    }
    
}

extension YourNumberVC: UITextFieldDelegate {
     private func textFieldChanged() {
        if numberTF.text?.isEmpty == false {
            enterTheNumberButton.isEnabled = true
        } else {
            enterTheNumberButton.isEnabled = false
        }
    }
}
