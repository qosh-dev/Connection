//
//  MessageViewHeader.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import Foundation
import SwiftUI



struct MessageViewHeader : View {
    var member : Member
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var videoCallIsPresented = false
    @State var audioCallIsPresented = false
    var body: some View {
        
        
        VStack{
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                        .frame(width : 50, height: 50)
                        .clipped()
                        .font(.system(size: 28))
                        .foregroundColor(Color.blue)
                        .offset(x:0, y : 25)
                })
                Spacer()
                HStack{
                    Button(action: {
                        videoCallIsPresented.toggle()
                    }, label: {
                        Image(systemName: "camera.aperture")
                            .frame(width : 40, height: 40)
                            .clipped()
                            .background(Color(#colorLiteral(red: 0.7115139115, green: 0.5447041577, blue: 0.9686274529, alpha: 1)))
                            .cornerRadius(50)
                            .padding(.top)
                            .font(.system(size: 22))
                            .foregroundColor(Color.white)
                            .offset(y : 25)
                    })
                    
                    Button(action: {}, label: {
                        Image(member.image)
                            .resizable(capInsets: .init(top: -30, leading: -30, bottom: -30, trailing: -30), resizingMode: .stretch)
                            .frame(width : 60, height: 60)
                            .clipped()
                            .cornerRadius(50)
                            .shadow(color: .blue, radius: 1, x: 0.5, y: 0.5)
                            .padding(.top)
                    })
                    Button(action: {
                        audioCallIsPresented.toggle()
                    }, label: {
                        Image(systemName: "phone.fill")
                            .frame(width : 40, height: 40)
                            .clipped()
                            .background(Color(#colorLiteral(red: 0.7115139115, green: 0.5447041577, blue: 0.9686274529, alpha: 1)))
                            .cornerRadius(50)
                            .padding(.top)
                            .font(.system(size: 22))
                            .foregroundColor(Color.white)
                            .offset(y : 25)
                    })
                }
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "gearshape")
                        .frame(width : 50, height: 50)
                        .clipped()
                        .font(.system(size: 28))
                        .foregroundColor(Color.blue)
                        .offset(x:0, y : 25)
                })
            }
            VStack{
                Text(member.name).font(.title).bold()
                Text("@\(member.name.split(separator: " ").joined())")
                    .font(.subheadline)
                
            }
                .offset(y : 25)
            EmptyView().fullScreenCover(isPresented: $videoCallIsPresented, content: {
                videoCall(member : member, isPresented : $videoCallIsPresented)
            })
            EmptyView().fullScreenCover(isPresented: $audioCallIsPresented, content: {
                audioCall(member : member, isPresented : $audioCallIsPresented)
            })
        }
       
    }
}

struct MessageViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


