//
//  ContentView.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
struct ContentView: View {
    @State var account = ""
    @State var password = ""
    @State var name = ""
    
    var body: some View {
        
        TabView{
            SignInOrOut()
                .tabItem{
                    Text("登入")
                }.tag(1)
            Register()
                .tabItem{
                    Text("註冊")
                }.tag(0)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
