//
//  SignIn.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import Foundation
import SwiftUI
import FirebaseAuth
struct SignIn:View{
    @State var account = ""
    @State var password = ""
    @State var name = ""
    @Binding var Sign:Int
    var body: some View {
        VStack{
            Text("登入介面")
            HStack{
                Text("帳號")
                TextField("Your Account", text: $account)
            }
            HStack{
                Text("密碼")
                TextField("Your Password", text: $password)
            }
            HStack{
                Text("使用者名稱")
                TextField("Your Name", text: $name)
            }
            Button{
                print("hi")
                signIn(account: account, password: password)
                print("hello")
                Sign = InOrOut()
            }label:{
                Text("登入")
            }
        }
    }
}

func signIn(account: String, password: String){
    Auth.auth().signIn(withEmail: account, password: password) { result, error in
        guard error == nil else {
            print(error?.localizedDescription)
            return
         }
        print("success")
    }
}

