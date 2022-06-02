//
//  SignOut.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
struct SignOut:View{
    var user:User?
    @Binding var Sign:Int
    @FirestoreQuery(collectionPath: "user", predicates: [
        .isEqualTo("account", getUserData())
    ]) var users: [UserData]
    var body: some View{
        
        VStack{
            ForEach(users) {user in
                Text("已登入")
                HStack{
                    Text("使用者名稱：\(user.name)")
                }
                
                HStack{
                    Text("帳號：\(user.account)")
                    
                }
                HStack{
                    Text("密碼：\(user.password)")
                    
                }
            }
            
            Button{
                do {
                   try Auth.auth().signOut()
                    Sign = InOrOut()
                } catch {
                   print(error)
                }
                
            }label:{
                Text("登出")
            }
        }
    }
}

func getUserData() -> String{
    var name = ""
    if let user = Auth.auth().currentUser {
        name = user.email!
        return name
    }else{
        print("error")
        return "none"
    }
}
