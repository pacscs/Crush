//
//  UILabel.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 22/07/21.
//

import UIKit

extension UILabel {
    
    static func txtLabel (_ size: CGFloat, textColor: UIColor = .black, numberOfLine: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLine
        return label
    }
    
    static func txtBoldLabel (_ size: CGFloat, textColor: UIColor = .black, numberOfLine: Int = 1) -> UILabel {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLine
        return label
    }
    
    func addShadow () {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
    }
    
    
}
