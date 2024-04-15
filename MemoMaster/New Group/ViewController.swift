//
//  ViewController.swift
//  MemoMaster
//
//  Created by vako on 13.04.24.
//

import UIKit

struct Card {
    var imageName: String
    var title: String
    var description: String
}

var cards: [Card] = [
    Card(imageName: "iconRed", title: "Beka ras gverchi?", description: "ახლა გავხსენი დავალება ეს რააარიიიr"),
    Card(imageName: "iconPurple", title: "რამე სიმღერა მირჩიეთ", description: "დავალების კეთებისას ღამე ძაან მეძინება,ყავამ არ მიშველა"),
    Card(imageName: "iconGreen", title: "ფიგმამ თქვენც დაგტანჯათ?", description: "Green Description for User"),
    Card(imageName: "iconYello", title: "მეტი ბედინა გვინდა", description: "შევწუხდი დაბალი ხარისხით იწერს ყველას"),
    Card(imageName: "iconPurple", title: "Purple Icon Title", description: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი"),
]

protocol AddCardsDelegate: AnyObject {
    func didAddNewCard(imageName: String, title: String, description: String)
}

class ViewController: UIViewController {
    let cardCellIdentifier = "CardCell"
    
    let collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 160, height: 192), collectionViewLayout: collectionViewFlowLayout)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUI()
        viewControllerConstraints()
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @objc func addButtonTapped() {
        let addCardsViewController = AddCardsViewController()
        addCardsViewController.delegate = self
        navigationController?.pushViewController(addCardsViewController, animated: true)
    }
    
    func setupUI() {
        viewControllerConstraints()
        setupCollectionView()
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

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let spacing: CGFloat = 6
        let itemWidth = (collectionViewWidth - (2 * spacing)) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.2)
    }
}

extension ViewController: AddCardsDelegate {
    func didAddNewCard(imageName: String, title: String, description: String) {
        let newCard = Card(imageName: imageName, title: title, description: description)
        cards.append(newCard)
        collectionView.reloadData()
    }
}
