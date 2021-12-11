//
//  uiComponents.swift
//  Connection_chat
//
//  Created by Akbar Hamraev on 12/10/21.
//

import SwiftUI



struct UserImage : View {
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



struct ModalView<T>: View where T: View {
    @Binding var  isShowing : Bool
    var content:   () -> T
    @State private var isDragging = false
    
    @State var currHeight: CGFloat = 590
    var minHeight : CGFloat = 590
    var maxHeight : CGFloat = 700
    
    
    var body: some View {
        ZStack(alignment : .bottom){
            if(isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack{
                        ZStack {
                            Capsule()
                                .frame(width: 40, height: 6)
                                .padding(.bottom)
                        }.frame(height : 40)
                        .frame(maxWidth : .infinity)
                        .background(Color.white.opacity(0.00001))
                        .gesture(dragGesture)
                        content()
                    Spacer()
                    }
                .frame(height : currHeight)
                .frame(maxWidth : .infinity)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                        Rectangle()
                            .frame(height : currHeight / 2)
                        
                    }.foregroundColor(.white)
                )
                .animation(isDragging ? nil : .easeInOut(duration: 0.45))
                .onDisappear{
                    isShowing = false
                }
                .onAppear{
                    currHeight = minHeight
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    
    
    @State private var prevDragTransition = CGSize.zero
    var dragGesture : some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if(!isDragging) {
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTransition.height
                if(currHeight > maxHeight || currHeight < minHeight) {
                    currHeight -= dragAmount / 6
                } else {
                    currHeight -= dragAmount
                }
                
                prevDragTransition = val.translation
            }
            .onEnded { val in
                prevDragTransition = .zero
                isDragging = false
                if currHeight > maxHeight {
                    currHeight = minHeight
                } else if currHeight < minHeight {
                    isShowing = false
                }
            }
    }
}
struct Components_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView()
        }
    }
}

