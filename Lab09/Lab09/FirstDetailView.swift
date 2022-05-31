//
//  FirstDetailView.swift
//  Lab09
//
//  Created by Macbook on 2022/5/25.
//

import SwiftUI

struct FirstDetailView: View {
    
    let list: CostList
    
    var body: some View {
        
        VStack{
            
                        Text("\(list.name)")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        List{
                            HStack{
                                Text("價格")
                                Spacer()
                                Text("\(list.cost)")
                                    .foregroundColor(.gray)
                            }
                            HStack{
                                Text("備註")
                                Spacer()
                                Text("\(list.comment)")
                                    .foregroundColor(.gray)
                            }
                        }
                        .cornerRadius(15)
                        .scaledToFit()
                        .padding(.horizontal)
                            
            
                        Spacer()
        }
        
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDetailView(list:CostList(name: "1", cost: 100, comment: "1"))
    }
}
