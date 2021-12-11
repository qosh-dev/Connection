//
//  ChatItemView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation
import SwiftUI


struct ChatItemView : View {
    
    var member : User
    @State var isExpanded : Bool = false
    var body : some View {
        VStack{
            
            HStack{
                
                NavigationLink(
                    destination: ChatView(member : member),
                    label: {
                        UserImage(imageName: member.image)
                        VStack(alignment : .leading){
                            Text(member.name)
                                .font(.title2)
                            HStack{
                                Text("Sent").font(.subheadline).foregroundColor(.gray)
                                Text("30 min ago").font(.callout).foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Spacer()
                    })
                if let _ = member.file{
                    Button(action: {
                        isExpanded.toggle()
                    }, label: {
                        HStack{
                            Text("2")
                                .font(.footnote)
                                .frame(width : 25, height : 25)
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .cornerRadius(50)
                            HStack {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height : 15)
                                    .padding(.leading)
                                Text("2:00")
                                    .padding(.trailing, 9)
                                    .padding(5)
                            }
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                        }
                        .frame(height : 35)
                        .padding()
                    })
                }
                
            }
            .padding(.leading)
            ChatItemMediaPlayer(member : member, isExpanded: $isExpanded)
        }
    }
}



