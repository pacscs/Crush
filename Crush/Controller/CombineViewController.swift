//
//  CombineViewController.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 22/07/21.
//

import UIKit

enum Action {
    case deslike
    case like
    case superlike
}

class CombineViewController: UIViewController {
    
    
    var perfilButton: UIButton = .iconMenu(named: "icone-perfil")
    var chatButton: UIButton = .iconMenu(named: "icone-chat")
    var logoButton: UIButton = .iconMenu(named: "icone-logo")

    
    var deslikeButton: UIButton = .iconFooter(named: "icone-deslike")
    var likeButton: UIButton = .iconFooter(named: "icone-like")
    var superlikeButton: UIButton = .iconFooter(named: "icone-superlike")

    
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.systemGroupedBackground
        
        let loading = Loading(frame: view.frame)
        view.insertSubview(loading, at: 0)
        
        self.addHeader()
        self.addFooter()
        self.searchUsers()
    }
    
    func searchUsers () {
//        self.users = UserService.shared.shearchUsers()
//        self.addCards()
        UserService.shared.shearchUsers { (users, err) in
            if let users = users {
                
                DispatchQueue.main.async {
                    self.users = users
                    self.addCards()
                }
                
            }
        }

    }
}


extension CombineViewController {
    func addHeader () {
        
        let windown = UIApplication.shared.windows.first { $0.isKeyWindow }
        let top: CGFloat = windown?.safeAreaInsets.top ?? 44
        
        
        let stackView = UIStackView(arrangedSubviews: [perfilButton, logoButton, chatButton])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.fill(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: nil, padding: .init(top: top, left: 16, bottom: 0, right: 16))
        
    }
    func addFooter () {
        
        let stackView = UIStackView(arrangedSubviews: [UIView(), deslikeButton, superlikeButton, likeButton, UIView()])
        stackView.distribution = .equalCentering
        
        view.addSubview(stackView)
        stackView.fill(top: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, padding: .init(top: 0, left: 16, bottom: 34, right: 16))
        
        
        
        
        deslikeButton.addTarget(self, action: #selector(deslikeClick), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(likeClick), for: .touchUpInside)
        superlikeButton.addTarget(self, action: #selector(superlikeClick), for: .touchUpInside)
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
            
            view.insertSubview(card, at: 1)
        }
    }

        func removeCard (card: UIView) {
            card.removeFromSuperview()
            
            self.users = self.users.filter({ (user) -> Bool in
                return user.id != card.tag
            })
        }
    func checkMatch (user: User) {
        if user.match {
            
        }
    }
}

extension CombineViewController {
    @objc func handleCard (_ gesture: UIPanGestureRecognizer) {
        
        if let card = gesture.view as? CombineCardView {
            let point = gesture.translation(in: view)
            
            card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            
            
            let rotationAngle = point.x / view.bounds.width * 0.4
            
            if point.x > 0 {
                card.likeImageView.alpha = rotationAngle * 5
                card.deslikeImageView.alpha = 0
            } else {
                card.likeImageView.alpha = 0
                card.deslikeImageView.alpha = rotationAngle * -5 
            }
            
            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            if gesture.state == .ended {
                
                if card.center.x > self.view.bounds.width + 50 {
                    self.animeCard(rotationAngle: rotationAngle, action: .like)
                    return
                }
                
                if card.center.x < -50 {
                    self.animeCard(rotationAngle: rotationAngle, action: .deslike)
                    return
                }
                
                UIView.animate(withDuration: 0.2) {
                    card.center = self.view.center
                    card.transform = .identity
                    
                    card.likeImageView.alpha = 0
                    card.deslikeImageView.alpha = 0

                }
                
            }
            
        }
        
    }
    
    @objc func deslikeClick () {
        self.animeCard(rotationAngle: -0.4, action: .deslike)
        
        }
    
    @objc func likeClick () {
        self.animeCard(rotationAngle: 0.4, action: .like)
        
        }
    
    @objc func superlikeClick () {
        self.animeCard(rotationAngle: 0, action: .superlike)
        
        }
    
    func animeCard (rotationAngle: CGFloat, action: Action) {
        if let user = self.users.first {
            for view in self.view.subviews {
                if view.tag == user.id {
                    if let card = view as? CombineCardView {
                        
                        let center: CGPoint
                        
                        var like: Bool
                        
                        switch action {
                        case .deslike:
                            center = CGPoint(x: card.center.x - self.view.bounds.width, y: card.center.y + 50)
                            like = false
                        case .like:
                            center = CGPoint(x: card.center.x + self.view.bounds.width, y: card.center.y + 50)
                            like = true
                        case .superlike:
                            center = CGPoint(x: card.center.x, y: card.center.y - self.view.bounds.height)
                            like = true
                        }
                        
                        UIView.animate(withDuration: 0.4, animations: {
                            card.center = center
                            card.transform = CGAffineTransform(rotationAngle: rotationAngle)
                            card.deslikeImageView.alpha = like == false ? 1 : 0
                            card.likeImageView.alpha = like == true ? 1 : 0
                        }) {(_) in
                            
                            
                            if like {
                                self.checkMatch(user: user)
                            }
                                
                            self.removeCard(card: card)
                        }

                    }
                }
            }
        }
    }
}
