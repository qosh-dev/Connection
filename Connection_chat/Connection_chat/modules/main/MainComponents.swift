//
//  Components.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI


struct RombButton : View {
    var iconName : String
    var action : () -> ()
  
    var body : some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(.system(size: 28.0, weight: .medium))
                .foregroundColor(Color.white)
                .padding(10)
                .rotationEffect(Angle(degrees: -45))
        }
            .padding(25)
            .shadow(radius: 5)
            .background(Color.blue)
            .cornerRadius(30)
            .rotationEffect(Angle(degrees: 45))
            
        .shadow(color: .gray, radius: 5, x: 0.1, y: 0.1)
    }
}
