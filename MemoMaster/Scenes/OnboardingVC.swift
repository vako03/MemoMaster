//
//  onboardingVC.swift
//  MemoMaster
//
//  Created by vako on 13.04.24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    let splashLabel: UILabel = {
        let label = UILabel()
        label.text = "შედი\nაპლიკაციაში\nდა იწუწუნე\nრამდენიც გინდა"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 117/255, blue: 1, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
        onBoardConstraints()
        startButton.addAction(UIAction { [weak self] _ in
                  self?.moveToNextViewController()
              }, for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    
    func onBoardConstraints() {
        view.addSubview(splashLabel)
        view.addSubview(startButton)
        

        
        NSLayoutConstraint.activate([
            
            
            splashLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            splashLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            splashLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -91),
            
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 222),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.widthAnchor.constraint(equalToConstant: 123),
        ])
    }
    
    // Method to move to the next view controller
        func moveToNextViewController() {
            let mainViewController = ViewController()
            navigationController?.pushViewController(mainViewController, animated: true)
        }
}
