//
//  TimerViewController.swift
//  Comma App
//
//  Created by Ananya Kodali on 7/16/20.
//  Copyright © 2020 Mya Sen. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {

    var previousVC = MeditationViewController()
    var musicEffect: AVAudioPlayer = AVAudioPlayer()
    //outlets for labels
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var timer = Timer()
    var hour = 0
    var minute = 0
    var second = 0
    var counter = 0
    var started = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set hours minutes seconds in timer
         hour = previousVC.hour
         minute = previousVC.minute
         second = previousVC.second
         counter = previousVC.counter
        musicEffect = previousVC.musicEffect
        startButton.setTitle("START", for: .normal)
        if (hour <= 9) {
            hoursLabel.text = "0\(hour)"
        }
        if (hour >= 10){
            hoursLabel.text = String(hour)
        }
        if (minute <= 9) {
            minutesLabel.text = "0\(minute)"
        }
        if (minute >= 10){
            minutesLabel.text = String(minute)
        }
        if (second <= 9) {
            secondsLabel.text = "0\(second)"
        }
        if (second >= 10) {
            secondsLabel.text = String(second)
        }
        // Do any additional setup after loading the view.
    }
    
           // set minutes/hours/seconds in bottom timer
    @objc func updateTimer() {
        counter -= 1
        hour = Int(counter/3600)
        minute = Int((counter % 3600)/60)
        second = counter % 60
    
     if (hour <= 9) {
         hoursLabel.text = "0\(hour)"
     }
     if (hour >= 10){
         hoursLabel.text = String(hour)
     }
     if (minute <= 9) {
         minutesLabel.text = "0\(minute)"
     }
     if (minute >= 10){
         minutesLabel.text = String(minute)
     }
     if (second <= 9) {
         secondsLabel.text = "0\(second)"
     }
     if (second >= 10) {
         secondsLabel.text = String(second)
     }
    }
    
    @IBAction func startPressed(_ sender: Any) {
        if (started == false) {timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            startButton.setTitle("FINISH", for: .normal)
           started = true
            musicEffect.play()
           
           
            
        } else {
            timer.invalidate()
            second = 0
            hour = 0
            minute = 0
            counter = 0
            secondsLabel.text = "0\(second)"
            minutesLabel.text = "0\(minute)"
            hoursLabel.text = "0\(hour)"
            startButton.setTitle("START", for: .normal)
            started = false
            musicEffect.stop()
        
            
        }
    }
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
        if (musicEffect.isPlaying == true) {
        musicEffect.stop()
        } else {
        musicEffect.play()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
