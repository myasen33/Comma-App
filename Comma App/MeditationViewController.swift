//
//  MeditationViewController.swift
//  Comma App
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 Mya Sen. All rights reserved.
//

import UIKit
import AVFoundation

class MeditationViewController: UIViewController {
    
    var musicFile : String?
    var musicEffect: AVAudioPlayer = AVAudioPlayer()

    //set up button outlets
    @IBOutlet weak var rainButton: UIButton!
    @IBOutlet weak var forestButton: UIButton!
    @IBOutlet weak var oceanButton: UIButton!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var backgroundGradientView: UIView!
    var hour = 0
    var minute = 0
    var second = 0
    var counter = 0
    let darkPurple = UIColor(red: 49/255, green: 22/255, blue: 60/255, alpha: 1.0)
    let lightGreen = UIColor(red: 49/255, green: 22/255, blue: 60/255, alpha: 1.0)
    let lightBlue = UIColor(red: 195/255, green: 233/255, blue: 220/255, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker?.datePickerMode = .countDownTimer
              
        timePicker?.addTarget(self, action: #selector(MeditationViewController.setTimer), for: .valueChanged)
        
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
        }

        override var shouldAutorotate: Bool {
            return false
        }


    @objc func setTimer(timePicker: UIDatePicker) {
           
    //get minutes/hours separately from timepicker
           let date = timePicker.date
           let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        hour = components.hour!
        minute = components.minute!
        counter = 3600 * hour + 60 * minute
        second = counter % 60
}
    
    @IBAction func rainTapped(_ sender: Any) {
        rainButton.backgroundColor = lightBlue
        
        
        musicFile = Bundle.main.path(forResource: "rain", ofType: "mp3")
        do {
           
           musicEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        }
        
        catch {
        
            print(error)
        }
        
    }
    @IBAction func forestTapped(_ sender: Any) {
        forestButton.backgroundColor = lightBlue
        musicFile = Bundle.main.path(forResource: "forest", ofType: "mp3")
        do {
           
           musicEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        }
        
        catch {
        
            print(error)
        }
    }
    @IBAction func oceanTapped(_ sender: Any) {
        oceanButton.backgroundColor = lightBlue
        musicFile = Bundle.main.path(forResource: "ocean", ofType: "mp3")
        do {
           
           musicEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicFile!))
        }
        
        catch {
        
            print(error)
        }
    }
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let addVC = segue.destination as? TimerViewController {
                 addVC.previousVC = self
               
               }
    }
}


