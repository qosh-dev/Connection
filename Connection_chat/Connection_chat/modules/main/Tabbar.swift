//
//  Tabbar.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/9/21.
//

import SwiftUI

struct Tabbar: View {
    
    @Binding var index : Int
    var body: some View {
        ZStack{
            
            
           
            HStack(spacing: 200){
                Button(action: {
                    index = 0
                }) {
                    Image(systemName: "message")
                        .font(.system(size: 32, weight: .medium))
                        .foregroundColor(Color.blue)
                }.padding()
                Button(action: {
                    index = 2
                }) {
                    Image(systemName: "person")
                        .font(.system(size: 32.0, weight: .medium))
                        .foregroundColor(Color.blue)
                }.padding()
                
            }
                .padding(.init(top: 20, leading: 20, bottom: 20, trailing: 30))
                .frame(height: 90)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
            
            RombButton(iconName: "phone.fill",action : {
                index = 1
            }).offset(y: -50)
        }.offset(y : 20)
//        .blur(radius : 2)
//        .zIndex(10)
    }
}

//
struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
