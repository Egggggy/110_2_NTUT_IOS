//
//  ContentView.swift
//  imageClassification
//
//  Created by mac mini on 2022/6/15.
//

import SwiftUI

struct ContentView: View {
    
    let photos = ["bird","cat","dog","monkey","pangolin"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel: String = "Click"
    @State private var classificationLabel2: String = "Classify"
    
    let model2 = Resnet50()
    let model = MobileNetV2()
    
    private func performImageClassification(){
        let currentImage = photos[currentIndex]
        
        let img = UIImage(named: currentImage)
        let resizedImage = img?.resizeTo(size: CGSize(width: 224, height: 224))
        let buffer = resizedImage?.toBuffer()
        
        let output = try? model.prediction(image: buffer!)
        let output2 = try? model2.prediction(image: buffer!)
        if let output = output {
            let results = output.classLabelProbs.sorted { $0.1 > $1.1}
            
            let result = results.map{(key, value) in
                return "\(key) = \(value * 100)%"
            }.joined(separator: "\n")
            classificationLabel = result
        }
        if let output2 = output2 {
            let results = output2.classLabelProbs.sorted { $0.1 > $1.1}
            
            let result = results.map{(key, value) in
                return "\(key) = \(value * 100)%"
            }.joined(separator: "\n")
            classificationLabel2 = result
        }
    }
    
    
    var body: some View {
        VStack {
            Image(photos[currentIndex])
            .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous") {
                    
                    if self.currentIndex > 0 {
                        self.currentIndex = self.currentIndex - 1
                    } else {
                        self.currentIndex = self.photos.count - 1
                    }
                    
                    }.padding()
                    .background(Color(red: 0.7098039215686275, green: 0.8705882352941177, blue: 1.0))
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    } else {
                        self.currentIndex = 0
                    }
                    self.classificationLabel = "Click"
                    self.classificationLabel2 = "Classify"
                }
                .padding()
                .frame(width: 100)
                .background(Color(red: 0.7098039215686275, green: 0.8705882352941177, blue: 1.0))
                .cornerRadius(10)
            
                
                
            }.padding()
            
            Button("Classify") {
                performImageClassification()
                
            }.padding()
                .background(Color(red: 0.7568627450980392, green: 1.0, blue: 0.8431372549019608))
            .cornerRadius(8)
            HStack{
                VStack{
                    Text("MobileNetV2:")
                        .font(.title)
                        .padding()
                    Divider()
                    Text(classificationLabel)
                        .font(.body)
                        .padding()
                }
                VStack{
                    Text("Resnet50:")
                        .font(.title)
                        .padding()
                    Divider()
                    Text(classificationLabel2)
                        .font(.body)
                        .padding()
                }
                
            }
            Spacer()
        }
        .background(Color(#colorLiteral(red: 0.988235294, green: 1, blue: 0.650980392, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
