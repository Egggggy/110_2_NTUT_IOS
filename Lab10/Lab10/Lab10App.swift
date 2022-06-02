//
//  Lab10App.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import SwiftUI
import Firebase
@main
struct Lab10App: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
