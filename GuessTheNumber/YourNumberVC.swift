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
    
    @IBAction func enterTheNumberPressed(_ sender: UIButton) {
    }
    
        let minValue = 0
        let maxValue = 100
        lazy var valuesRange = minValue...maxValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTF.delegate = self
        numberTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        enterTheNumberButton.isEnabled = false
        enterTheNumberButton.layer.cornerRadius = 15    }
}

extension YourNumberVC: UITextFieldDelegate {
    @objc private func textFieldChanged() {
        if numberTF.text?.isEmpty == false {
            enterTheNumberButton.isEnabled = true
        } else {
            enterTheNumberButton.isEnabled = false
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
          return true
        }
        return valuesRange.contains(Int(newText) ?? minValue)
      }
    }
