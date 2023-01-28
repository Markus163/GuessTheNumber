//
//  ScoresVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import Foundation
import UIKit

class ScoresVC: UIViewController {
    
    var yourCount = ""
    var computerCount = ""
    
    @IBOutlet weak var mainMenuButton: UIButton!
    @IBOutlet weak var yourTriesCountLabel: UILabel!
    @IBOutlet weak var computersTriesCountLabel: UILabel!
    @IBOutlet weak var mainMenuButtonPressed: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func mainMenuButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToMainMenu", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yourTriesCountLabel.text = yourCount
        computersTriesCountLabel.text = computerCount
        mainMenuButton.layer.cornerRadius = 15
        result()
    }
    
    func result() {
        if yourCount == computerCount {
            resultLabel.text = "Draw"
        } else {
            if yourCount > computerCount {
                resultLabel.text = "You Lose"
            } else {
                resultLabel.text = "You Win"
            }
        }
    }
}
