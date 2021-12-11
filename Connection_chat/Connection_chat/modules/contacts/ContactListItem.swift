//
//  ContactListItem.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/11/21.
//

import SwiftUI

struct ContactListItem: View {
    
    @State var audioCallIsPresented = false
    var user : User
    var body : some View {
        VStack{
            
            Button(action: {
                audioCallIsPresented = true
            }, label: {
                HStack{
                    UserImage(imageName: user.image)
                    VStack(alignment : .leading){
                        Text(user.name)
                            .font(.title2)
                        HStack{
                            Text(user.phoneNumber).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                    .padding(.leading)
                    Spacer()
                }
            })
            
            .padding(.bottom)
            .padding(.leading)
        }
        EmptyView().fullScreenCover(isPresented: $audioCallIsPresented, onDismiss : {
            audioCallIsPresented = false
        }, content: {
            audioCall(user : user , isPresented : $audioCallIsPresented)
        })
    }
}

struct ContactListItem_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        
    }
}
