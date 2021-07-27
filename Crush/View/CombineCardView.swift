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
    
    
    let picImageView: UIImageView = .picImageView()
    
    let nameLabel: UILabel = .txtBoldLabel(32, textColor: .white)
    let ageLabel: UILabel = .txtLabel(28, textColor: .white)
    let phraseLabel: UILabel = .txtLabel(18, textColor: .white, numberOfLine: 2)
    
    let deslikeImageView: UIImageView = .iconCard(named: "card-deslike")
    let likeImageView: UIImageView = .iconCard(named: "card-like")

    override init (frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nameLabel.addShadow()
        ageLabel.addShadow()
        phraseLabel.addShadow()
        
        addSubview(picImageView)
        
        addSubview(deslikeImageView)
        deslikeImageView.fill(top: topAnchor, leading: nil, trailing: trailingAnchor, bottom: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 20))
        
        addSubview(likeImageView)
        likeImageView.fill(top: topAnchor, leading: leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        
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
