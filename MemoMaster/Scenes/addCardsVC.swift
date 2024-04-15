//
//  addCardsVC.swift
//  MemoMaster
//
//  Created by vako on 14.04.24.
//

import UIKit


class AddCardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var delegate: AddCardsDelegate?
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "სათაური"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: პანიკა, დახმარება მჭირდება",
                                                             attributes: [NSAttributedString.Key.foregroundColor:
                                                                            UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0)])
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0)
        textField.backgroundColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1.0).cgColor
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "აღწერა"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ",
                                                             attributes: [NSAttributedString.Key.foregroundColor:
                                                                            UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0)])
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.textColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0)
        textField.backgroundColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1.0).cgColor
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1.0).cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let titleIconLabel: UILabel = {
        let label = UILabel()
        label.text = "აირჩიეთ აიქონი"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let mainVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 155/255, blue: 16/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    let iconImages = ["iconGreen", "iconPurple", "iconRed", "iconYello"]
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addAttributes()
        setupCollectionView()
        addButton.addAction(UIAction(handler: { [weak self] _ in
                self?.addCardButtonTapped()
            }), for: .touchUpInside)
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
    
    func addAttributes(){
        view.addSubview(mainVerticalStack)
        mainVerticalStack.addArrangedSubview(titleLabel)
        mainVerticalStack.addArrangedSubview(mainTextfield)
        mainVerticalStack.addArrangedSubview(descriptionLabel)
        mainVerticalStack.addArrangedSubview(detailTextfield)
        mainVerticalStack.addArrangedSubview(titleIconLabel)
        
        
        NSLayoutConstraint.activate([
            mainVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 91),
            mainVerticalStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            mainVerticalStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 27
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: IconCollectionViewCell.reuseIdentifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: mainVerticalStack.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  80),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -25),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconCollectionViewCell.reuseIdentifier, for: indexPath) as! IconCollectionViewCell
        cell.iconImageView.image = UIImage(named: iconImages[indexPath.item])
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _ = iconImages[indexPath.item]
        for cell in collectionView.visibleCells {
            if let iconCell = cell as? IconCollectionViewCell {
                iconCell.iconImageView.isHighlighted = false
            }
        }
        
        
        if let selectedCell = collectionView.cellForItem(at: indexPath) as? IconCollectionViewCell {
            selectedCell.iconImageView.isHighlighted = true
        }
    }
    
    // MARK: - Button Action
    
    func addCardButtonTapped() {
        var selectedIconName: String = ""
        
        if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
            selectedIconName = iconImages[selectedIndexPath.item]
        }
        
        delegate?.didAddNewCard(imageName: selectedIconName, title: mainTextfield.text ?? "", description: detailTextfield.text ?? "")
        
        navigationController?.popViewController(animated: true)
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
