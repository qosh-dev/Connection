//
//  ChatItemMediaPlayer.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation
import SwiftUI


struct ChatItemMediaPlayer : View {
    var member : Member
    @Binding var isExpanded : Bool
    var body: some View {
        if(isExpanded){
            
            ZStack{
                MemberImage(imageName: member.image)
                    .offset(y: -170)
                    .zIndex(1)
                VStack{
                    
                    Text(member.name)
                        .font(.title)
                        .padding(.top, 35)
                    Text("01:11")
                    Rectangle()
                        .foregroundColor(Color.clear)
                    HStack(spacing: 60){
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrowshape.turn.up.left")
                                .font(.system(size: 26, weight: .medium))
                                .foregroundColor(Color.blue)
                        }.padding()
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "pause.circle.fill")
                                .font(.system(size: 28.0, weight: .medium))
                                .foregroundColor(Color.blue)
                                .padding(10)
                                .rotationEffect(Angle(degrees: -45))
                        }
                        .padding(15)
                        
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(radius: 5)
                        .rotationEffect(Angle(degrees: 45))
                        .offset(y: -15)
                        Button(action: {
                            
                            
                        }) {
                            Image(systemName: "paperplane")
                                .font(.system(size: 26, weight: .medium))
                                .foregroundColor(Color.blue)
                        }.padding()
                        
                    }
                    .offset(y: -20)
                }
                .padding()
                .background(Color.white)
                .frame(height : 400)
                .cornerRadius(20)
                .offset(y: 30)
                
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
            }
            .padding()
            .frame(height : 460)
        } else {
            EmptyView()
        }
        
    }
}

