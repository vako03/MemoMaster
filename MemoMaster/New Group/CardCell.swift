//
//  CardCell.swift
//  MemoMaster
//
//  Created by vako on 14.04.24.
//


import UIKit

class CardCell: UICollectionViewCell {
    let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16) // Set the font size to 12 points
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10) // Set the font size to 12 points
        label.textColor = UIColor(red: 94/255, green: 98/255, blue: 114/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(iconImage)
        addSubview(labelTitle)
        addSubview(textDescription)
        layer.cornerRadius = 12

           

         
           
           NSLayoutConstraint.activate([
               iconImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
               iconImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
               iconImage.heightAnchor.constraint(equalToConstant: 40),
               iconImage.widthAnchor.constraint(equalToConstant: 40),
               
               labelTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 12),
               labelTitle.leadingAnchor.constraint(equalTo: iconImage.leadingAnchor, constant: 0),
               labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
               
               textDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 0), // No spacing
               textDescription.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
               textDescription.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
               textDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -6) // Adjusted the bottom constraint
           ])
        
        backgroundColor = UIColor(red: 38/255, green: 42/255, blue: 52/255, alpha: 1.0)

       }

    
    func configure(with card: Card) {
        iconImage.image = UIImage(named: card.imageName)
        labelTitle.text = card.title
        textDescription.text = card.description
    }
    
    
}

