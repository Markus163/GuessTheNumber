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
    
    let minValue = 1
    let maxValue = 100
    lazy var valuesRange = minValue...maxValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTF.delegate = self
        numberTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        enterTheNumberButton.isEnabled = false
        enterTheNumberButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goTryOne" else { return }
        guard let tryOneVC = segue.destination as? TryOneVC else { return }
        guard let text = numberTF.text else { return }
        let yourNumber = String("My number is \(text)")
        tryOneVC.myNumber = yourNumber
    }
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
        guard let text = textField.text else { return true }
        let newText = NSString(string: text).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
          return true
        }
        return valuesRange.contains(Int(newText) ?? minValue)
      }
    }
