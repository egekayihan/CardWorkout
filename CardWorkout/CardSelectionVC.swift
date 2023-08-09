//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Ege Kayihan on 9.08.2023.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    /*@IBOutlet var stopButton: UIButton!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var rulesButton: UIButton! */
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Deck.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         stopButton.layer.cornerRadius = 8
         restartButton.layer.cornerRadius = 8
         rulesButton.layer.cornerRadius = 8
         */

        startTimer()
        
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
}
