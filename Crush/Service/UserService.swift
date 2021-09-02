//
//  UserService.swift
//  Crush
//
//  Created by Paulo Alfredo Coraini de Souza on 22/07/21.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    
    let users: [User] = [
    User(id: 101, name: "Maria Silva", Age: 19, match: true, phrase: "O ultimo a dar match chama", photo: "pessoa-1"),
    User(id: 102, name: "Debora Lima", Age: 25, match: false, phrase: "Deu like sem querer?", photo: "pessoa-2"),
    User(id: 103, name: "Sandra Souza", Age: 24, match: false, phrase: "Acho q a gente combina", photo: "pessoa-3"),
    User(id: 104, name: "Anna Beatriz", Age: 22, match: true, phrase: "Não bebo não fumo e não curto balada", photo: "pessoa-4"),
    User(id: 105, name: "Laura Oliveira", Age: 26, match: true, phrase: "Quer saber mais sobre mim?", photo: "pessoa-5"),
    User(id: 106, name: "Silva Paz", Age: 19, match: false, phrase: "Se não for conversar nem dá like", photo: "pessoa-6"),
    User(id: 107, name: "Debora Lima", Age: 25, match: false, phrase: "Em busca de novas amizades", photo: "pessoa-7"),
    User(id: 108, name: "Sandra Souza", Age: 24, match: true, phrase: "Fotos sem camisa não me impressionam", photo: "pessoa-8"),
    User(id: 109, name: "Tah Beatriz", Age: 22, match: false, phrase: "Oi pelo visto a gente combina", photo: "pessoa-9"),
    User(id: 110, name: "Laura Oliveira", Age: 26, match: true, phrase: "Procurando um bom papo", photo: "pessoa-10"),
    User(id: 111, name: "Sabrina Santos", Age: 21, match: false, phrase: "Quem se descreve se limita", photo: "pessoa-11"),
    User(id: 112, name: "Amelia Margaret", Age: 30, match: false, phrase: "Não quero nada casual", photo: "pessoa-12"),
    User(id: 113, name: "Laura Komako", Age: 26, match: true, phrase: "Bom humor é fundamental", photo: "pessoa-13"),
    User(id: 114, name: "Rosa Oliveira", Age: 25, match: false, phrase: "Não sei me descrever", photo: "pessoa-14"),
    User(id: 115, name: "Nadia Joana", Age: 20, match: false, phrase: "Quer saber mais? é só dar like", photo: "pessoa-15"),
    User(id: 116, name: "Mary Dandara", Age: 20, match: false, phrase: "Tenho um relacionamento aberto", photo: "pessoa-16"),
    User(id: 117, name: "Anita Eleanor", Age: 23, match: false, phrase: "Bonita demais pra ser verdade", photo: "pessoa-17"),
    User(id: 118, name: "Helen Aung San", Age: 24, match: true, phrase: "Espero q vc seja mente aberta", photo: "pessoa-18"),
    User(id: 119, name: "Laura Nelle", Age: 18, match: false, phrase: "Estou aqui para fazer novas amizades", photo: "pessoa-19"),
    User(id: 120, name: "Maria Virginia", Age: 18, match: false, phrase: "Adoro balada", photo: "pessoa-20")]
    
    func shearchUsers (completion: @escaping ([User]?, Error?) -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(self.users, nil)
        
        }
    }
    
}
