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
    
    @IBOutlet weak var backgroundGradientView: UIView!
    
    var previousVC = MeditationViewController()
    var musicEffect: AVAudioPlayer = AVAudioPlayer()
    var alarmEffect: AVAudioPlayer = AVAudioPlayer()
    //outlets for labels
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var colon1Button: UILabel!
    @IBOutlet weak var colon2Button: UILabel!
    @IBOutlet weak var sessionFinished: UILabel!
    
    var timer = Timer()
    var hour = 0
    var minute = 0
    var second = 0
    var counter = 0
    var started = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a gradient layer.
        let gradientLayer = CAGradientLayer()
        // Set the size of the layer to be equal to size of the display.
        gradientLayer.frame = view.bounds
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a Color Literal and a UIColor from RGB values.
        gradientLayer.colors = [UIColor(red: 195/255, green: 196/255, blue: 233/255, alpha: 1).cgColor, UIColor(red: 220/255, green: 196/255, blue: 233/255, alpha: 1).cgColor, UIColor(red: 233/255, green: 195/255, blue: 221/255, alpha: 1).cgColor]
        // Rasterize this static layer to improve app performance.
        gradientLayer.shouldRasterize = true
        // Apply the gradient to the backgroundGradientView.
        backgroundGradientView.layer.addSublayer(gradientLayer)
        // Diagonal: top left to bottom corner.
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        
        //set hours minutes seconds in timer
        homeButton.isHidden = true
        sessionFinished.isHidden = true
         hour = previousVC.hour
         minute = previousVC.minute
         second = previousVC.second
         counter = previousVC.counter
        musicEffect = previousVC.musicEffect
        startButton.setTitle ("START", for: .normal)
        startButton.setTitleColor(UIColor(red: 49/255, green: 22/255, blue: 60/255, alpha: 1.0), for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Avenir-Light", size: 21)
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
    func finish() {
          timer.invalidate()
          pauseButton.isHidden =  true
          startButton.isHidden = true
          homeButton.isHidden = false
          sessionFinished.isHidden = false
          minutesLabel.isHidden = true
          secondsLabel.isHidden = true
          hoursLabel.isHidden = true
          colon1Button.isHidden = true
          colon2Button.isHidden = true
          musicEffect.stop()
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
        if (second == 0 && minute == 0 && hour == 0) {
            finish()
            let musicFile = Bundle.main.path(forResource: "alarm", ofType: "mp3")
               do {
                  
                  alarmEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
               }
               
               catch {
               
                   print(error)
               }
            alarmEffect.play()
        }
    }
    
  
    @IBAction func startPressed(_ sender: Any) {
        if (started == false) {timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            startButton.setTitle("FINISH", for: .normal)
           started = true
            musicEffect.play()
           
           
            
        } else {
            finish()
            started = false
        
            
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
    
    override var shouldAutorotate: Bool {
        return false
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
