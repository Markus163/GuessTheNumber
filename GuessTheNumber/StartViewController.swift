//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startNewGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGameButton.layer.cornerRadius = 20
    }


}

