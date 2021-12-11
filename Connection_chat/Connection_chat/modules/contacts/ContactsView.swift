//
//  ContactsView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI



struct ContactsView: View {
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let chatInteractor = ChatInteractor()
    @Binding var phoneNumberText : String
    @Binding var isShowingKeyBoard : Bool
    func SearchResult() -> Array<User>{
        let result = chatInteractor.ChatMembers.filter({ "\($0.name.lowercased())".contains(phoneNumberText.lowercased()) })
        return result.count == 0 ? chatInteractor.ChatMembers : result
    }
    
    
    var KeyBoard : some View {
        VStack(){
            HStack(alignment : .top) {
                //            Divider()
                
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(Chars, id: \.self) { el in
                        Button(action: {
                            phoneNumberText += el.text
                        }, label: {
                            VStack{
                                Text("\(el.text)")
                                    .font(.largeTitle)
                                Text("\(el.subText ?? "")")
                                    .font(.subheadline)
                                    .foregroundColor(Color(.lightGray))
                            }
                        })
                        .frame(width: 50, height: 55)
                        .cornerRadius(10)
                        
                    }
                    Button(action: {
                        phoneNumberText = String(phoneNumberText.dropLast())
                    }, label: {
                        Image(systemName: "delete.left.fill")
                            .font(.system(size: 22))
                    })
                    
                }
            }
        }
        
    }
    var body: some View {
        
        
        VStack{
            Spacer()
            HStack{
                Text("Recent contacts")
                    .foregroundColor(.secondary)
                    .padding(.leading)
                Spacer()
            }
            
            ScrollView{
                ForEach(SearchResult(), id:\.self) {
                    ContactListItem(user: $0)
                }
                .padding(.top)
            }
        }
        ModalView(isShowing: $isShowingKeyBoard){
            VStack{
                Text(phoneNumberText)
                    .font(.title)
                    .frame(height: 20)
                    .padding(.top)
                    .padding(.bottom)
                
                KeyBoard
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea()
            .animation(.easeInOut)
        }
        
        .navigationBarHidden(true)
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
