//
//  SplashViewController.swift
//  MemoMaster
//
//  Created by vako on 13.04.24.
//

import UIKit

class SplashViewController: UIViewController {
    // MARK: - Properties
    
    let labelSplashView: UILabel = {
        let label = UILabel()
        label.text = "Map Moments"   //  ფონტი მაქვს შესაცვლელი
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splashScreenTextConstraints()
        setupBackground()
        
    }
    
    func splashScreenTextConstraints() {
        view.addSubview(labelSplashView)
        
        NSLayoutConstraint.activate([
            labelSplashView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelSplashView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    func setupBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 24/255, green: 26/255, blue: 32/255, alpha: 1.0).cgColor,
            UIColor(red: 25/255, green: 24/255, blue: 45/255, alpha: 1.0).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
