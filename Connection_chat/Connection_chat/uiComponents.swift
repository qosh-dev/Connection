//
//  uiComponents.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI



struct MemberImage : View {
    var imageName : String
    var body : some View {
        Image(imageName)
            .resizable(capInsets: .init(top: -30, leading: -30, bottom: -30, trailing: -30), resizingMode: .stretch)
            .frame(width : 80, height: 80)
            .clipped()
            .cornerRadius(20)
            .shadow(color: .blue, radius: 1, x: 0.5, y: 0.5)
    }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search terms here", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                    }
                    
                }.padding(.horizontal, 32)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
            
        }
    }
    
}

