//
//  audioCall.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI

struct audioCall: View {
    
    var member : Member
    @Binding var isPresented : Bool
    var body: some View {
        NavigationView{
            ZStack {
                EmptyView().blur(radius: 10)
                Image(member.image)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(10)
                    .frame(
                        width: 220,
                        height: 220,
                        alignment: .center
                    )
                    .background(Color(.green))
                    .cornerRadius(50)
                    .edgesIgnoringSafeArea(.top)
                    
                VStack{
                    VStack{
                        Text(member.name).font(.title).bold()
                        Text("@\(member.name.split(separator: " ").joined())")
                            .font(.subheadline)
                        
                    }
                    .foregroundColor(.black)
                    .padding(.top)
                    Spacer()
                    
                    
                    EmptyView().blur(radius: 10)
                    HStack(spacing: 50)
                    {
                        Button(action: {},
                               label: {
                                Image(systemName: "mic.slash.fill")
                                    .foregroundColor(Color.white)
                                
                               })
                            .padding()
                            .frame(width : 70, height: 70)
                            .clipped()
                            .font(.system(size: 30))
                            .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                            .cornerRadius(50)
                        
                        Button(
                            action: {
                                isPresented = false
                            },
                            label: {
                                Image(systemName: "phone.down.fill")
                                    .foregroundColor(Color.white)
                            })
                            .padding()
                            .frame(width : 70, height: 70)
                            .clipped()
                            .font(.system(size: 30))
                            .background(Color.red)
                            .cornerRadius(50)
                        
                        Button(action: {}, label: {
                            Image(systemName: "volume.3")
                                .foregroundColor(Color.white)
                        })
                        .padding()
                        .frame(width : 70, height: 70)
                        .clipped()
                        .font(.system(size: 30))
                        .background(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        .cornerRadius(50)
                    }
                    
                    .padding(.bottom, 90)
                    
                }
                .zIndex(1)
            }
        }
    }
}

struct audioCall_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


