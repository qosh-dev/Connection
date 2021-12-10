//
//  MessageView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation
import SwiftUI

struct MessageView : View {
    var member : Member
    var message : Message
    let chatInteractor = ChatInteractor()
    
    var TextView : some View {
        Text(message.text ?? "Not defined")
            .padding()
            .background(Color.white)
            .cornerRadius(20)
    }
    
    var body: some View {
        
        HStack(alignment: .bottom){
            if(message.senderId == 1) {
                Spacer()
                TextView
            } else {
                Image(member.image)
                    .resizable(capInsets: .init(top: -30, leading: -30, bottom: -30, trailing: -30), resizingMode: .stretch)
                    .frame(width : 45, height: 45)
                    .clipped()
                    .cornerRadius(50)
                    .shadow(color: .blue, radius: 1, x: 0.5, y: 0.5)
                    .padding(.top)
                TextView
                
                Spacer()
            }
        }
        .padding()
        .padding(.bottom, 20)
    }
}


