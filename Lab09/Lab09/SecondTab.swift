//
//  SecondTab.swift
//  Lab09
//
//  Created by Macbook on 2022/5/30.
//

import SwiftUI
import Foundation
struct SecondTab: View {
    @EnvironmentObject var lists:Lists
    var body: some View {
        NavigationView{
            List{
                ForEach(lists.lists, id:\.name){ list in
                    NavigationLink{
                        FirstDetailView(list:list)
                    }label:{
                        Text(list.name)
                    }
                    
                        
                }
            }
        }
        
    }
}

struct SecondTab_Previews: PreviewProvider {
    static var previews: some View {
        SecondTab()
    }
}
