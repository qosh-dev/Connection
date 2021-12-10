//
//  ChatInteractor.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation


class ChatInteractor {
    
    
    
    
    
    
    let ChatMembers : Array<Member> = [
        .init(id: 0, name: "Bruce Wayne", image: "wp7021823"),
        .init(id: 1, name: "Dart Wayder", image: "wp5220145", file: Data()),
        .init(id: 2, name: "Lara Croute", image: "wp7021878"),
        .init(id: 3, name: "Silvana Windrunner", image: "wp7021836"),
        .init(id: 4, name: "Wonder Woman", image: "wp5115158")
    ]



    let messages : Array<Message> = [
        .init(id: 0, senderId: 1, receiverId: 2, text: "What's your name ?"),
        .init(id: 1, senderId: 2, receiverId: 1, text: "What ?"),
        .init(id: 2, senderId: 1, receiverId: 2, text: "What is your name ?"),
        .init(id: 3, senderId: 1, receiverId: 2, text: "What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?What is your name ?"),
    ]
    
    
    
    
    func getMember(id : Int) -> Member? {
        let entries = ChatMembers.filter{ $0.id == id }
        if let member = entries[0] as? Member {
            return member
        }
        return nil
    }

}
