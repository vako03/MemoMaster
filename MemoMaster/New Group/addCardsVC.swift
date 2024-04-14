//
//  addCardsVC.swift
//  MemoMaster
//
//  Created by vako on 14.04.24.
//

import UIKit

class AddCardsViewController: UIViewController {
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal) // fonti
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 155/255, blue: 16/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        viewControllerConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        viewControllerConstraints()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    

    func viewControllerConstraints() {
        view.addSubview(addButton)
        
        
        NSLayoutConstraint.activate([
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -103),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 121),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.widthAnchor.constraint(equalToConstant: 132),
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

