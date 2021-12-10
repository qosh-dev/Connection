//
//  MainView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/9/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedIndex = 0
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                switch selectedIndex {
                case 0 :
                    ChatListView()
                    
                case 1 :
                    Text("TEMP \(selectedIndex)")
                case 2 :
                    Spacer()
                default:
                    EmptyView()
                }
                
                VStack{
                    Spacer()
                        .sheet(isPresented: .constant(selectedIndex == 2), content: {
                            Button(action: {
                                selectedIndex = 0
                            }, label: {
                                VStack{
                                    Spacer()
                                    Text("FULL Screen cover")
                                        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                }
                            }) .frame(height : 55)
                        })
                    
                    
                    
                    Tabbar(index : $selectedIndex)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView()
            MainView()
                .colorScheme(.dark)
        }
    }
}


