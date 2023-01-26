//
//  TryTwoVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 26.01.2023.
//

import UIKit

class TryTwoVC: UIViewController {
    
    @IBOutlet weak var numTF: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBAction func guessButtonPressed(_ sender: UIButton) {
        
        let guessNumber = Int(numTF.text!)
        
        if guessNumber != nil {
            if numberToGuess == guessNumber {
                hintLabel.text = ""
                performSegue(withIdentifier: "goToScores", sender: nil)
            } else {
                if numberToGuess < guessNumber! {
                    hintLabel.text = "No, my number is less than yours"
                } else {
                    if numberToGuess > guessNumber! {
                        hintLabel.text = "No, my number is more than yours"
                    }
                }
            }
        }
        if guessNumber == nil {
            hintLabel.text = ""
        }
    }
    
    var tapCount: Int = 0
    
    let numberToGuess = Int.random(in: 0...1)
    override func viewDidLoad() {
        super.viewDidLoad()
        guessButton.addTarget(self, action: #selector(multipleTap(sender:)), for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScores" {
            guard let identifier = segue.identifier,
                  let scoresVC = segue.destination as? ScoresVC
            else { return }
            
            //scoresVC.incomeSegueIdentifier = identifier
            //mapVC.mapViewControllerDelegate = self

            var yourTriesCount = String("Yours's tries count:\(tapCount)")
            scoresVC.yourTriesCountLabel.text = yourTriesCount
            //scoresVC.computersTriesCount.text = "2"
        }
    }
}
extension TryTwoVC {
    @objc func multipleTap(sender: UIButton) {
        tapCount += 1
        print(tapCount)
    }
}
