//
//  UIImageView.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 27/07/21.
//

import UIKit

extension UIImageView {
    
    static func picImageView (named: String? = nil)  -> UIImageView {
        let imageView = UIImageView ()
        if let named = named {
            imageView.image = UIImage(named: named)
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
        
    }
    
    static func  iconCard (named: String) -> UIImageView {
        let imageView = UIImageView ()
        imageView.image = UIImage(named: named)
        imageView.size(size: .init(width:70, height: 70))
        imageView.alpha = 0.0
        return imageView
    }
    
}

