//
//  TryTwoVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 26.01.2023.
//

import UIKit

class SecondGameRoundVC: UIViewController {
    
    @IBOutlet weak var numTF: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    var numberModel = NumberModel()
    
    var tapCount: Int = 0
    var computerTapCount: String = ""
    let numberToGuess = Int.random(in: 1...100)
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        tapCount += 1
        guard let guessNumber = Int(numTF.text ?? "") else { return }
        
        if numberToGuess == guessNumber {
            rightNumber()
        } else {
            wrongNumber(number: guessNumber)
        }
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Methods
    private func setupView() {
        numTF.delegate = self
        numTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        guessButton.isEnabled = false
        guessButton.layer.cornerRadius = 15
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToScores" else { return }
        guard let scoresVC = segue.destination as? ScoresVC else { return }
        let yourTriesCount = String(tapCount)
        let computerTriesCount = String(computerTapCount)
        scoresVC.yourCount = yourTriesCount
        scoresVC.computerCount = computerTriesCount
    }
    
    private func rightNumber() {
        hintLabel.text = ""
        performSegue(withIdentifier: "goToScores", sender: nil)
    }
    
    private func wrongNumber(number: Int) {
        if numberToGuess < number {
            hintLabel.text = "No, my number is less than yours"
        } else {
            if numberToGuess > number {
                hintLabel.text = "No, my number is more than yours"
            }
        }
    }
}

//MARK: - Extension UITextFieldDelegate
extension SecondGameRoundVC: UITextFieldDelegate {
    @objc private func textFieldChanged() {
        if numTF.text?.isEmpty == false {
            guessButton.isEnabled = true
        } else {
            guessButton.isEnabled = false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newText = NSString(string: text).replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            return true
        }
        return numberModel.valuesRange.contains(Int(newText) ?? 1)
    }
}

//MARK: - Extension for keyboard
extension SecondGameRoundVC {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
