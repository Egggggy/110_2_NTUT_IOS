//
//  NumberImage.swift
//  Lab07
//
//  Created by Macbook on 2022/5/11.
//

import SwiftUI
struct NumberImage: View {
    let number: Int
    var body: some View {
        Image(systemName: "\(number).circle.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
