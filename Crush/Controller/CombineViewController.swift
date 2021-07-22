//
//  CombineViewController.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 22/07/21.
//

import UIKit

class CombineViewController: UIViewController {
    
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemGroupedBackground
        
        self.searchUsers()
    }
    
    func searchUsers () {
        self.users = UserService.shared.shearchUsers()
        self.addCards()

    }
}

extension CombineViewController {
    func addCards () {
        
        for user in users {
            
            let card = CombineCardView()
            card.frame = CGRect(x: 0, y: 0, width: view.bounds.width - 32, height: view.bounds.height * 0.7)
            
            card.center = view.center
            card.user = user
            card.tag = user.id
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(handleCard))
            
            card.addGestureRecognizer(gesture)
            
            view.insertSubview(card, at: 0)
        }

    }

}

extension CombineViewController {
    @objc func handleCard (_ gesture: UIPanGestureRecognizer) {
        if let card = gesture.view{
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended {
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                }
                
            }
            
        }
        
    }
}
