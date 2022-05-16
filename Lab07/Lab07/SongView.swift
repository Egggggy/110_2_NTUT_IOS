//
//  SongView.swift
//  Lab07
//
//  Created by Macbook on 2022/5/11.
//

import SwiftUI
struct SongView: View {
    let song: String
    let number: Int
    
    var body: some View {
        VStack {
            Image(song)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
            Text(song)
        }
        .overlay(alignment: .topLeading, content: {
            NumberImage(number: number)
        })
    }
}
