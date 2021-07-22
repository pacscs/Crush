//
//  CombineCardView.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 22/07/21.
//

import UIKit

class CombineCardView: UIView {
    
    var user: User? {
        didSet {
            if let user = user {
                picImageView.image = UIImage(named: user.photo)
                nameLabel.text = user.name
                ageLabel.text = String(user.Age)    
                phraseLabel.text = user.phrase
            }
        }
    }
    
    
    let picImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pessoa-1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    let nameLabel: UILabel = .txtBoldLabel(32, textColor: .white)
    let ageLabel: UILabel = .txtLabel(28, textColor: .white)
    let phraseLabel: UILabel = .txtLabel(18, textColor: .white, numberOfLine: 2)
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.text = "Ana Laura"
        ageLabel.text = "20"
        phraseLabel.text = "O último a dar match chama"
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        phraseLabel.addShadow()
        
        addSubview(picImageView)
        
        picImageView.fillSuperview()
        
        
        
        
        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, UIView()])
        nameAgeStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nameAgeStackView, phraseLabel])
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fill(top: nil, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
