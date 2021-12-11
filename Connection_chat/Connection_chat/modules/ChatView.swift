//
//  ChatView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI

struct ChatView: View {
    var member : User
    var chatInteractor = ChatInteractor()
    @State var messageText = ""
    
    @State var chatMessages : Array<Message> =  []
    
    func onSendMessagePress() {
        
        let newMessage = Message(
            id: 100,
            senderId: 1,
            receiverId: member.id,
            time : Date(),
            text: messageText
        )
        
        chatMessages.append(newMessage)
        print("Message sended \(messageText)")
        messageText = ""
    }
    
    var body: some View {
        ZStack{
            
            VStack{
                MessageViewHeader(member: member)
                    .padding(.bottom, 25)
                Spacer()
                ScrollViewReader { value in
                    ScrollView {
                        
                        ForEach(chatMessages, id: \.id) {
                            MessageView(member : member, message: $0)
                            
                        }
                        .onAppear{
                            value.scrollTo(chatMessages.last?.id, anchor: .center)
                        }.onChange(of: chatMessages.count, perform: { _ in
                            value.scrollTo(chatMessages.last?.id, anchor: .center)
                        })
                    }
                    
                    
                }
                .offset(y : 25)
                Spacer()
                
                
                
                MessageTextField(
                    messageText: $messageText,
                    onSendMessagePress: {
                        onSendMessagePress()
                    }
                )
                
            }
            .background(Color(#colorLiteral(red: 0.9234941904, green: 0.9897264257, blue: 1, alpha: 1)))
        }
        .onAppear(perform: {
            chatMessages = chatInteractor.messages
        })
        .navigationBarHidden(true)
    }
}






struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView()
            MainView()
                .colorScheme(.dark)
        }
    }
}
