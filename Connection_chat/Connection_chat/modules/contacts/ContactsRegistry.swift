//
//  ContactsRegistry.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/11/21.
//

import Foundation


struct ContactsKeyboard : Hashable {
    var id : Int?
    var text : String
    var subText : String?
}

var Chars : Array<ContactsKeyboard> = [
    .init(text: "1"),
    .init(text: "2", subText: "ABC"),
    .init(text: "3", subText: "DEF"),
    .init(text: "4", subText: "GHI"),
    .init(text: "5", subText: "JKL"),
    .init(text: "6", subText: "MNO"),
    .init(text: "7", subText: "PQRS"),
    .init(text: "8", subText: "YUV"),
    .init(text: "9", subText: "WXYZ"),
    .init(text: "*"),
    .init(text: "0", subText: "+"),
    .init(text: "#"),
    .init(id : 1,text: ""),
    .init(id : 2,text: ""),
]
