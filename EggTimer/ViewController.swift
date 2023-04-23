//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
    var secondsRemaining = 60
    var totalSeconds = 60
    var timer = Timer()
    
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func resetButton(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        titleText.text = "How do you like your eggs?"
        
    }
    @IBAction func eggButton(_ sender: UIButton) {
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        secondsRemaining = eggTimes[hardness]!
        
        totalSeconds = secondsRemaining
        
        // invalidate any existing timers from previous button clicks
        timer.invalidate()
        progressBar.progress = 0
        
        // scheduling a timer in repeat mode after each second.
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                             target: self,
                                             selector: #selector(updateTimer),
                                             userInfo: nil,
                                             repeats: true)
               
    }
    
    @objc private func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds ...")
           
            
            secondsRemaining -= 1
            progressBar.progress = Float(totalSeconds - secondsRemaining) / Float(totalSeconds)
            print(progressBar.progress)
        } else {
            titleText.text = "Done!"
            progressBar.progress = 1
            timer.invalidate()
        }
        
    }
    
//    func printBoilTime(text: String) -> Void {
//        switch (text) {
//        case "Soft":
//            print(5)
//        case "Medium":
//            print(8)
//        case "Hard":
//            print(12)
//        default:
//            print("error")
//        }
//    }
    
    func startTimer() {
        
    }
}
