//
//  ChatsView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/9/21.
//

import SwiftUI

struct ChatListView: View {
    @State var searchText = ""
    @State var isSearching = false
    let chatInteractor = ChatInteractor()
    var body: some View {

            
            ZStack{
                
                VStack(alignment: .leading, spacing : 0) {
                    SearchBar(searchText: $searchText, isSearching: $isSearching)
                        .padding(.bottom)
                        .onTapGesture {
                            
                        }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Spacer()
                            Text("Manage")
                                .font(.callout)
                                .padding(.trailing)
                        }
                    })
                    ScrollView{
                        
                        ForEach(chatInteractor.ChatMembers.filter({ "\($0.name.lowercased())".contains(searchText.lowercased()) || searchText.isEmpty }), id:\.self) {
                            ChatItemView(member: $0)
                            
                        }
                        .padding(.top)
                        .padding(.bottom, 160)
                    }
                }
            }
            .navigationTitle("All Friends")
            .navigationBarTitleDisplayMode(.large)
        
    }
}



struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
