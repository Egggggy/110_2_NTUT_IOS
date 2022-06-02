//
//  SignInOrOut.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
struct SignInOrOut:View{
    @State var Sign = InOrOut()
    
    @State var name = ""
    var body: some View{
        if Sign == 2{
            SignOut(Sign:$Sign)
        }else if Sign == 1{
            SignIn(Sign:$Sign)
        }
    }
}

func InOrOut() -> Int{
    if let user = Auth.auth().currentUser{
        return 2
    }else{
        return 1
    }
}
