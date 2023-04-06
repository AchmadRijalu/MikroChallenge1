//
//  OnBoarding.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct OnBoarding: View {
    
    var items:[String] =  ["Action","Fighting", "Sports", "Sandbox", "Real Time Strategy", "FPS", " Multiplayer Online Battle Arena", "RPG", "Action Adventure", "Platformer"]
    
    @State var selectedRows = Set<String>()
    var body: some View {
        NavigationView{
            List{
                ForEach(items, id: \.self){
                    item in Text(item)
                }
            }
            .navigationTitle("")
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
