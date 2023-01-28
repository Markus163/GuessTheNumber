//
//  TryOneVC.swift
//  GuessTheNumber
//
//  Created by Марк Михайлов on 25.01.2023.
//

import UIKit

class FirstGameRoundVC: UIViewController {
    
    var tapCount: Int = 1
    var myNumber = ""
    var computerNumber = ""
    var numberModel = NumberModel()
    
    @IBOutlet weak var myNumberLabel: UILabel!
    @IBOutlet weak var computerNumberLabel: UILabel!
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        tapCount += 1
        computerNumberLabel.text = String("Your number is - \(numberModel.moreNumber())")
    }
    
    @IBAction func equalButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToTryTwo", sender: nil)
    }
    
    @IBAction func lessButtonPressed(_ sender: Any) {
        tapCount += 1
        computerNumberLabel.text = String("Your number is - \(numberModel.lessNumber())")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        giveNumbersForAnswers()
    }
    
    private func giveNumbersForAnswers() {
        myNumberLabel.text = myNumber
        computerNumberLabel.text = String("Your number is - \(numberModel.maxValue / 2)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToTryTwo" else { return }
        guard let tryTwoVC = segue.destination as? SecondGameRoundVC else { return }
        let computerTriesCount = String(tapCount)
        tryTwoVC.computerTapCount = computerTriesCount
    }
}

