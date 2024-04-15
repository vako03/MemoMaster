//
//  ViewController.swift
//  MemoMaster
//
//  Created by vako on 13.04.24.
//

import UIKit


protocol AddCardsDelegate: AnyObject {
    func didAddNewCard(imageName: String, title: String, description: String)
}

class ViewController: UIViewController {
    let cardCellIdentifier = "CardCell"
    
    // MARK: - Properties

    let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 160, height: 180), collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add new cards", for: .normal)
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
        setupBackground()
        setupUI()
        viewControllerConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Button Action

    func addButtonTapped() {
          let addCardsViewController = AddCardsViewController()
          addCardsViewController.delegate = self
          navigationController?.pushViewController(addCardsViewController, animated: true)
      }

    // MARK: - UI Setup

    func setupUI() {
        viewControllerConstraints()
        setupCollectionView()
        addButton.addAction(UIAction(handler: { [weak self] _ in
                   self?.addButtonTapped()
               }), for: .touchUpInside)
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 77),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -287)
        ])
    }
    
    func viewControllerConstraints() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -104),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 43),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.widthAnchor.constraint(equalToConstant: 290),
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

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardCellIdentifier, for: indexPath) as! CardCell
        let card = cards[indexPath.item]
        cell.configure(with: card)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let spacing: CGFloat = 6
        let itemWidth = (collectionViewWidth - (2 * spacing)) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.1)
    }
}

// MARK: - AddCardsDelegate

extension ViewController: AddCardsDelegate {
    func didAddNewCard(imageName: String, title: String, description: String) {
        let newCard = Card(imageName: imageName, title: title, description: description)
        cards.append(newCard)
        collectionView.reloadData()
    }
}
