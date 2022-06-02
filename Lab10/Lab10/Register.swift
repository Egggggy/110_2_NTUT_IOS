//
//  Register.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
struct Register:View{
    @State var account = ""
    @State var password = ""
    @State var name = ""
    var Login = false
    var body: some View {
        
        VStack{
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
                createUser(name: name, account: account, password: password)
                print("\(name), \(account),\(password)")
            }label:{
                Text("註冊")
            }
        }
    }
}

func createUser(name: String, account: String, password: String){
    let db = Firestore.firestore()
    Auth.auth().createUser(withEmail: account, password: password) { result, error in
                
         guard let user = result?.user,
               error == nil else {
             print(error?.localizedDescription)
             return
         }
         print(user.email, user.uid)
    }
            let user = UserData(account: account, name: name,  password: password)
            do {
                let documentReference = try db.collection("user").addDocument(from: user)
                print(documentReference.documentID)
            } catch {
                print(error)
            }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
