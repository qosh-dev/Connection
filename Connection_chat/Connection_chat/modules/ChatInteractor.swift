//
//  ChatInteractor.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation


class ChatInteractor {
    
    
    
    
    
    
    let ChatMembers : Array<User> = [
        .init(id: 0, name: "Bruce Wayne", image: "wp7021823", phoneNumber : "+992900000000"),
        .init(id: 1, name: "Dart Wayder", image: "wp5220145", file: Data(), phoneNumber : "+9929999999"),
        .init(id: 2, name: "Lara Croute", image: "wp7021878", phoneNumber : "+9929222222"),
        .init(id: 3, name: "Silvana Windrunner", image: "wp7021836", phoneNumber : "+9929111111"),
        .init(id: 4, name: "Wonder Woman", image: "wp5115158", phoneNumber : "+992912312312")
    ]



    let messages : Array<Message> = [
        .init(id: 0, senderId: 1, receiverId: 2, text: "What's your name ?"),
        .init(id: 1, senderId: 2, receiverId: 1, text: "What ?"),
        .init(id: 2, senderId: 1, receiverId: 2, text: "What is your name ?")
    ]
    
    
    
    
    func getMember(id : Int) -> User? {
        let entries = ChatMembers.filter{ $0.id == id }
        if let member = entries[0] as? User {
            return member
        }
        return nil
    }

}
