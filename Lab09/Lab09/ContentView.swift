//
//  ContentView.swift
//  Lab09
//
//  Created by Macbook on 2022/5/25.
//

import SwiftUI
import Foundation
struct ContentView: View {
    @StateObject private var lists = Lists()
    
    var body: some View {
        TabView{
            FirstTab()
                
                .tabItem{Text("記帳")}
            SecondTab()
                .tabItem{Text("清單")}
    }.environmentObject(lists)
        
        
    }
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
