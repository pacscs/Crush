//
//  UIButton.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 27/07/21.
//

import UIKit

extension UIButton {
    
    static func iconFooter (named: String) -> UIButton {
        let button = UIButton()
        button.size(size: .init(width: 64, height: 64))
        button.setImage(UIImage(named: named), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 32
        button.clipsToBounds = true
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3.0
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.masksToBounds = false
        
        return button
    }
    
    static func iconMenu (named: String) -> UIButton {
        let button = UIButton()
        button.size(size: .init(width: 32, height: 32))
        button.setImage(UIImage(named: named), for: .normal)
        
        return button
    }
}
