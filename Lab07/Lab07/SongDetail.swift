//
//  SongDetail.swift
//  Lab07
//
//  Created by Macbook on 2022/5/11.
//

import SwiftUI
struct SongDetail: View {
let song: Song

var body: some View {
    VStack {
            Image(song.name)
            .resizable()
            .scaledToFit()
            Text(song.lyrics)
            .padding()
        }
        .navigationTitle(song.name)

    }
}
struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song: .DemoSong)
    }
}
