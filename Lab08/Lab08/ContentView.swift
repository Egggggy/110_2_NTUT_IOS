//
//  ContentView.swift
//  Lab08
//
//  Created by Macbook on 2022/5/18.
//

import SwiftUI

struct ContentView: View {
    let song = ["李白","喜劇之王","麻雀","年少有為"]
    @State private var name = ""
    @State private var image = false
    @State private var birthday = Date()
    @State private var selectedIndex = 0
    @State private var like: Double = 0
    @State private var age = 0
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        VStack(alignment: .center){
            Image("李榮浩")
                .cornerRadius(450).shadow(color: .black, radius: 5, x: 1, y: 1)
            Text("李榮浩")
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .frame(width: 350, height: 50, alignment: .center)
            TextField("Your Name:",text: $name).frame(width: 350, height: 50, alignment: .center)
            Stepper {
                        Text("年齡: \(age)")
            }onIncrement: {
                age += 1
            }onDecrement: {
                age -= 1
            }
            .frame(width: 350, height: 40, alignment: .center)
            Toggle("聽過他的歌嗎",isOn: $image)
                .frame(width: 350, height: 40, alignment: .center)
            DatePicker("你的生日", selection: $birthday)
                .frame(width: 350, height: 40, alignment: .center)
            HStack{
                    Text("喜歡聽他唱")

                 Picker(selection: $selectedIndex) {
                                Text(song[0]).tag(0)
                                Text(song[1]).tag(1)
                                Text(song[2]).tag(2)
                                Text(song[3]).tag(3)
           
                }label: {
                                Text("選擇歌曲")
                            }
            }.frame(width: 350, height: 50, alignment: .center)
            
            Text("喜歡程度:\(Int(like))")
                    Slider(value: $like, in: 0...10, step: 1)
                .frame(width: 350, height: 20, alignment: .center)
            
            Button{
                showAlert = true
                alertTitle = image ? "我聽過他的歌":"我沒聽過他的歌"
            }label:{
                Text("送出")
            }.alert(alertTitle, isPresented: $showAlert, actions: {
                Button("OK") { }
            }, message:{
                Text("我的名字叫\(name)\n今年為\(age)歲\n生日為\(birthday)\n喜歡聽他的\(song[selectedIndex])\n喜歡程度為\(Int(like))")
            })
            
                    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
