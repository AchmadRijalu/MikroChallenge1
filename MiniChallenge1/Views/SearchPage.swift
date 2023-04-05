//
//  SearchPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText = ""
    
    @Binding var isPresented: Bool
    @FocusState private var searchFocus: Bool


    var body: some View {
        
        NavigationStack {
            
            if searchText != ""{
                ChildView()
//                Text("Searching for \(searchText)")
                ScrollView{
                    VStack(spacing: 20){
                        HStack{
                            
                            OnsearchingItem(image: "rdr2", name: "Red Dead Redemption 2").padding(.trailing, 2)
                            OnsearchingItem(image: "re4", name: "Resident Evil 4 Remake")
                            
                        }.padding(.leading, 8)
                        HStack{
                            Spacer()
                            OnsearchingItem(image: "destiny2", name: "Destiny 2").padding(.trailing, 2)
                            OnsearchingItem(image: "hl", name: "Hogwarts Legacy")
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            OnsearchingItem(image: "tk8", name: "Tekken 8").padding(.trailing, 2)
                            OnsearchingItem(image: "cs2", name: "Counter Strike 2")
                            Spacer()
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(.top, 16)
                }.background(Color("CustomColor"))
            }
            else{
                ScrollView {
                    VStack(){
//                        HStack{
//                            Text("Discover").font(.system(size: 34, weight: .bold)).foregroundColor(.white)
//                            Spacer()
//                        }.padding(.bottom, 12)
                        HStack{
                            VStack(spacing: 16){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Adventure")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Action")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Horror")
                                    }
                                    Spacer()
                                }
                                
                            }
                            VStack(spacing: 16){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Sports")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("RPG")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Multiplayer")
                                    }
                                    Spacer()
                                }
                                
                            }
                           
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                    }.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
                    NavigationLink(destination: GetGameDetailPage(ID: "j5Xv2lM9wes")){
                        SearchItem(image: "hl").padding(.bottom, 12)
                    }
                    
                    SearchItem(image: "re4").padding(.bottom, 12)
                    SearchItem(image: "destiny2").padding(.bottom, 12)
                }.background(Color("CustomColor"))
                
                
            }
            EmptyView()
                .navigationTitle("Dashboard")
                
                .searchable(text: $searchText).focused($searchFocus).background(.white)
               
            
        }
        
    }
}
struct SearchItem: View {
    let image:String
    var body: some View {
        VStack{
            Image(image).resizable().scaledToFill()
        }.frame(width: 329, height: 91).cornerRadius(8).shadow(color: .indigo, radius: 7, x: 1, y: 5)
    }
}

struct OnsearchingItem: View {
    let image:String
    let name:String
    var body: some View {
        VStack{
            VStack{
                Image(image).resizable().scaledToFill()
            }.frame(width: 157, height: 206).cornerRadius(8).shadow(color: .indigo, radius: 7, x: 1, y: 3)
            
            VStack(alignment: .leading){
                Text(name).foregroundColor(.white).font(.system(size: 20, weight: .semibold)).padding(.bottom, 4).multilineTextAlignment(.leading)
                Text("$422").foregroundColor(.white).font(.system(size: 20, weight: .semibold)).padding(.bottom, 12)
            }

        }
    }
}



struct ChildView : View {
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        EmptyView()
            .onChange(of: isSearching) { newValue in
                if !newValue {
                    print("Searching cancelled")
                }
            }
    }
}


struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage(isPresented: .constant(true))
    }
}
