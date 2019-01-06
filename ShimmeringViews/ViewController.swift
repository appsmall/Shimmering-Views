//
//  ViewController.swift
//  ShimmeringViews
//
//  Created by Rahul Chopra on 06/01/19.
//  Copyright © 2019 Rahul Chopra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.setupViews()
    }

    func setupViews() {
        self.view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        let darkTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400))
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.boldSystemFont(ofSize: 80)
        darkTextLabel.textAlignment = .center
        self.view.addSubview(darkTextLabel)
        
        let shinyTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400))
        shinyTextLabel.text = "Shimmer"
        shinyTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        shinyTextLabel.font = UIFont.boldSystemFont(ofSize: 80)
        shinyTextLabel.textAlignment = .center
        self.view.addSubview(shinyTextLabel)
        
        // Now adding Gradient Layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = shinyTextLabel.frame
        
        let angle = 45 * (CGFloat.pi / 180)
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        // Adding gradient layer into the label layer mask
        shinyTextLabel.layer.mask = gradientLayer
        
        // Adding animation on moving gradient layer
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        animation.duration = 1
        gradientLayer.add(animation, forKey: "transform.translation.x")
        
    }
}

