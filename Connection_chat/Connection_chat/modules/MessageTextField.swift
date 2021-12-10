//
//  MessageTextField.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation
import SwiftUI




struct MessageTextField : View {
    @Binding var messageText : String
    @State private var sendBtnWidth : CGFloat = 0
    var onSendMessagePress : () -> ()
    var body: some View {
        HStack{
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24.0))
                        .padding(0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7115139115, green: 0.5447041577, blue: 0.9686274529, alpha: 1)))
                })
                TextField("Message input ", text: $messageText)
                    .onChange(of: messageText){ text in
                        withAnimation(.spring(response : 0.6)) {
                            if(text.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "") != ""){
                                sendBtnWidth = 30
                            } else {
                                sendBtnWidth = 0
                            }
                        }
                    }
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "mic")
                        .font(.system(size: 26.0))
                        .padding(0)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                })
                Button(action: {}, label: {
                    Image(systemName: "camera.circle.fill")
                        .font(.system(size: 26.0))
                        .padding(0)
                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                })
                
            }.padding(10)
            .background(Color(#colorLiteral(red: 0.8410311645, green: 0.9744343586, blue: 0.9793781726, alpha: 1)))
            .cornerRadius(20)
            
            
            Button(action: onSendMessagePress,
                   label: {
                    Image(systemName: "location")
                        .font(.system(size: 28.0))
                        .padding(0)
                        .foregroundColor(Color(#colorLiteral(red: 0.7115139115, green: 0.5447041577, blue: 0.9686274529, alpha: 1)))
                        .opacity(sendBtnWidth == 0 ? 0 : 1)
                    
                   }).frame(width : sendBtnWidth)
            
        }
        .padding(10)
        .background(Color.white)
    }
}


