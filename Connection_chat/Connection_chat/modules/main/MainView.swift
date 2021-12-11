//
//  MainView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/9/21.
//

import SwiftUI

struct MainView: View {
    
    @State var selectedIndex = 0
    @State var audioCallIsPresented = false
    @State var isShowingKeyBoard = false
    @State var inputPhoneNumber = ""
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
                    ContactsView(phoneNumberText : $inputPhoneNumber, isShowingKeyBoard : $isShowingKeyBoard)
                default:
                    AboutView()
                }
                
                VStack{
                    Spacer()
                    Tabbar(onPhoneTabPress : {
                        if(selectedIndex == 1 && isShowingKeyBoard ) {
                            if(inputPhoneNumber.count >= 9) {
                                audioCallIsPresented = true
                            }
                        } else {
                            selectedIndex = 1
                            isShowingKeyBoard = true
                        }
                    }, index : $selectedIndex)
                }
                
                
                //MARK: AudioCall
                EmptyView().fullScreenCover(isPresented: $audioCallIsPresented, onDismiss : {
                    audioCallIsPresented = false
                }, content: {
                    let undefinedContact = User(id: 0, name: "Some one", image: "", phoneNumber: inputPhoneNumber)
                    
                    audioCall(user : undefinedContact , isPresented : $audioCallIsPresented)
                    
                })
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


