//
//  HappyZoneViewController.swift
//  Comma App
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 Mya Sen. All rights reserved.
//

import UIKit
import SafariServices

class HappyZoneViewController: UIViewController {
    
    @IBOutlet weak var backgroundGradientView: UIView!


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
    }

    override var shouldAutorotate: Bool {
        return false

}
    @IBAction func news1(_ sender: UIButton) {
        if let url = URL(string: "https://www.positive.news/society/three-good-things-online-support-groups-started-during-lockdown/") {
            let safariVC = SFSafariViewController (url: url)
            
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func news2(_ sender: UIButton) {
        if let url = URL(string: "https://thenewdaily.com.au/news/good-news/2020/07/02/sign-language-to-speech/") {
            let safariVC = SFSafariViewController (url: url)
            
            present(safariVC, animated: true, completion: nil)
        }
    }

    
}
