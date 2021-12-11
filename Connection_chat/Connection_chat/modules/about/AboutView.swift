//
//  AboutView.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/11/21.
//

import SwiftUI

struct Link : Hashable {
    var id : Int
    var icon : String
    var title : String
    var color : UIColor
}
struct AboutView: View {
    let chatInteractor = ChatInteractor()
    
    @State var toggleValues : Array<Bool> = [false, false, true]
    
    let links : Array<Link> = [
        .init(id: 0, icon: "video.fill", title: "Video", color: .orange),
        .init(id: 1, icon: "photo.fill", title: "Images", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)),
        .init(id: 2, icon: "music.note", title: "Audio", color: .blue),
        .init(id: 3, icon: "location.fill", title: "Location", color: .lightGray),
        .init(id: 4, icon: "doc.fill",title: "Payment", color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
    ]
    
    
    var user : User
    init() {
        user = chatInteractor.getMember(id: 1)!
    }
    var body: some View {
        ZStack{
            VStack{
                Image(user.image)
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: 80,
                        height: 80,
                        alignment: .top
                    )
                    .cornerRadius(50)
                    .padding(.top)
                VStack{
                    Text(user.name).font(.title).bold()
                    Text("@\(user.name.split(separator: " ").joined())")
                        .font(.subheadline)
                    Text(user.phoneNumber).font(.title3)
                }
                .padding(.top, 5)
                Divider()
                Button(
                    action: {},
                    label: {
                        HStack{
                            Text("Saved messages")
                                .font(.headline)
                                .foregroundColor(Color(.darkGray))
                                .padding()
                        }
                    }
                )
                Divider()
                ScrollView{
                    HStack(alignment: .center, spacing: 4){
                        ForEach(links,id: \.self) { link in
                            Button(
                                action: {},
                                label: {
                                    VStack{
                                        Image(systemName: link.icon)
                                            .frame(
                                                width: 40,
                                                height: 40
                                            )
                                            .background(Color(link.color))
                                            .foregroundColor(.white)
                                            .cornerRadius(50)
                                        Text(link.title)
                                            .font(.caption)
                                            .padding(.top , 1)
                                    }
                                    .padding()
                                    .fixedSize(horizontal: true, vertical: false)
                                })
                        }.padding(.top, 5)
                    }
                    Divider()
                    
                    VStack{
                        HStack{
                            Text("Show status")
                            Spacer()
                            Toggle("", isOn: $toggleValues[0])
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                    VStack{
                        HStack{
                            Text("Show media popup")
                            Spacer()
                            Toggle("", isOn: $toggleValues[1])
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                    VStack{
                        HStack{
                            Text("Auto file download")
                            Spacer()
                            Toggle("", isOn: $toggleValues[2])
                        }
                        .padding(.horizontal)
                        Divider()
                    }
                }
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}




