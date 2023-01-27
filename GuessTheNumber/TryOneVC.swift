//
//  TryOneVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class TryOneVC: UIViewController {
    
    var minValue = 0
    var maxValue = 100
    lazy var middle = round(Double((minValue + maxValue) / 2))
    
    var tapCount: Int = 1
    
    @IBOutlet weak var myNumberLabel: UILabel!
    @IBOutlet weak var computerNumberLabel: UILabel!
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        moreNumber()
        tapCount += 1
        print(tapCount)
    }
    @IBAction func equalButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "computerTap", sender: nil)
    }
    @IBAction func lessButtonPressed(_ sender: Any) {
        lessNumber()
        tapCount += 1
        print(tapCount)
    }
    
    var myNumber = ""
    var computerNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNumberLabel.text = myNumber
        computerNumberLabel.text = String(maxValue / 2)
        
    }
    
    private func moreNumber() {
        minValue = Int(middle)
        middle = round(Double((minValue + maxValue) / 2))
        if minValue == Int(middle) {
            middle += 1
        }
        computerNumberLabel.text = String("Yor number is - \(Int(middle))")
    }
    
    private func lessNumber() {
        maxValue = Int(middle)
        middle = round(Double((minValue + maxValue) / 2))
        if maxValue == Int(middle) {
            middle -= 1
        }
        computerNumberLabel.text = String("Yor number is - \(Int(middle))")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "computerTap" else { return }
        guard let tryTwoVC = segue.destination as? TryTwoVC else { return }
        let computerTriesCount = String(tapCount)
        tryTwoVC.computerTapCount = computerTriesCount
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "goToScores2" else { return }
//        guard let scoresVC = segue.destination as? ScoresVC else { return }
//        let computerTriesCount = String("Computers's tries count: \(tapCount)")
//        scoresVC.computerCount = computerTriesCount
//    }
    
    
}

