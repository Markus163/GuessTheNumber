//
//  ScoresVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import Foundation
import UIKit

class ScoresVC: UIViewController {
    
    
    
    var yourCount = "1"
    //var computerCount = "1"
    
    @IBOutlet weak var yourTriesCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yourTriesCountLabel.text = yourCount
        //computersTriesCount.text = computerCount
    }
}
