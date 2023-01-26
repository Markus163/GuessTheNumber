//
//  TryOneVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class TryOneVC: UIViewController {
    
    @IBOutlet weak var myNumberLabel: UILabel!
    @IBOutlet weak var computerNumberLabel: UILabel!
    @IBAction func moreButtonPressed(_ sender: UIButton) {
    }
    @IBAction func equalButtonPressed(_ sender: Any) {
    }
    @IBAction func lessButtonPressed(_ sender: Any) {
    }
    
    var myNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNumberLabel.text = myNumber
    }
}
