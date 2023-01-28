//
//  YourNumberVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class YourGuestNumberVC: UIViewController {
    
    let minValue = 1
    let maxValue = 100
    lazy var valuesRange = minValue...maxValue
    
    @IBOutlet weak var enterTheNumberButton: UIButton!
    @IBOutlet weak var numberTF: UITextField!
    
    @IBAction func enterTheNumberPressed(_ sender: UIButton) {}
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Methods
    private func setupView() {
        numberTF.delegate = self
        numberTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        enterTheNumberButton.isEnabled = false
        enterTheNumberButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goTryOne" else { return }
        guard let tryOneVC = segue.destination as? FirstGameRoundVC else { return }
        guard let text = numberTF.text else { return }
        let yourNumber = String("My number is \(text)")
        tryOneVC.myNumber = yourNumber
    }
}

//MARK: - Extension UITextFieldDelegate
extension YourGuestNumberVC: UITextFieldDelegate {
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

//MARK: - Extension for keyboard
extension YourGuestNumberVC {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
