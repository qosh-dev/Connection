//
//  ChatTypes.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation


struct Member : Hashable {
    var id : Int
    var name : String
    var image : String
    var file : Data?
}

struct Message : Hashable {
    var id : Int
    var senderId : Int
    var receiverId : Int
    var time : Date = Date()
    var text : String?
    var audio : Data?
    var video : Data?
   
    
    func type() -> String {
        if let _ = text {
            return "text"
        }
        if let _ = audio {
            return "audio"
        }
        if let _ = video {
            return "video"
        }
        return "undefined"
    }
}


