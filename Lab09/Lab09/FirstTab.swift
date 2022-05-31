//
//  FirstTab.swift
//  Lab09
//
//  Created by Macbook on 2022/5/25.
//

import SwiftUI

struct FirstTab: View{
    @EnvironmentObject var lists:Lists
    
    @State var name = ""
    @State var cost = 0
    @State var comment = ""
    
    var body: some View {
        VStack {
            HStack{
                
                Text("名稱").padding()
                TextField("名稱", text: $name, prompt: Text("記帳名稱"))
                    .padding()
                    .overlay(textFieldBorder)
                    .padding()
            }
            HStack{
                
                Text("花費").padding()
                TextField("金額", value: $cost, format: .number, prompt: Text("金額"))
                    .padding()
                    .overlay(textFieldBorder)
                    .padding()
            }
            HStack{
                
                Text("備註").padding()
                TextField("備註", text: $comment, prompt: Text("內容"))
                    .padding()
                    .overlay(textFieldBorder)
                    .padding()
            }
            
            
            
            Button {
                let list = CostList(name: name, cost: cost, comment: comment)
                lists.lists.insert(list, at:0)
                for list in lists.lists{
                    print(list.name)
                }
            } label: {
                Text("新增")
            }
        }
        

    }
    var textFieldBorder: some View {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 5)
        }
}

struct FirstTab_Previews: PreviewProvider {
    static var previews: some View {
        FirstTab()
    }
}
