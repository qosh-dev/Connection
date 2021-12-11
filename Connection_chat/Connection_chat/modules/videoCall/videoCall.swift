//
//  videoCall.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI

struct videoCall: View {
    
    var member : User
    @Binding var isPresented : Bool
    var body: some View {
        NavigationView{
            ZStack {
                Image("videoCall")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height,
                        alignment: .center
                    )
                    .edgesIgnoringSafeArea(.top)
                VStack{
                    VStack{
                        Text(member.name).font(.title).bold()
                        Text("@\(member.name.split(separator: " ").joined())")
                            .font(.subheadline)
                        
                    }
                    .foregroundColor(.white)
                    .padding(.top)
                    Spacer()
                    HStack{
                        Spacer()
                        Image("videoCall2")
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                            .frame(width:120, height: 60)
                            .background(Color.green)
                            .padding()
                        
                        
                    }
                    .padding(.bottom, 60)
                    
                    
                    HStack(spacing: 50)
                    {
                        Button(action: {},
                               label: {
                                Image(systemName: "message.fill")
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
                            Image(systemName: "arrow.triangle.2.circlepath.camera.fill")
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

struct videoCall_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        //        videoCall()
    }
}


