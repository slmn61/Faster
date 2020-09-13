//
//  ViewController.swift
//  Faster
//
//  Created by selman birinci on 9/10/20.
//  Copyright © 2020 birinci. All rights reserved.
//

import UIKit
import CircleProgressBar
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var timer = Timer()
    
    var endTime: Date?
    var counter = 30
    var diff: Double = 0.0
    var fraction: Double = 100.0
    
    @IBOutlet weak var circleProgressBar: CircleProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleProgressBar.setProgress(CGFloat(diff)/CGFloat(fraction), animated: true)
        
        
        
    }

    
    
    @IBAction func fastingStartButton(_ sender: Any) {
        
        if let selectedTime = endTime?.timeIntervalSinceNow{
            diff = selectedTime
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        
        
    }
    
    @objc func updateCounter() {
        
        //example functionality
        if diff > 0 {
            print("\(diff) seconds to the end of the world")
            diff -= 1
        }else{
            timer.invalidate()
            //topLabel.text = topFinalText
            playSound()
        }
        circleProgressBar.setProgress(CGFloat(diff)/CGFloat(fraction), animated: true)
        
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        endTime = selectedDate
        
        print(selectedDate)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

