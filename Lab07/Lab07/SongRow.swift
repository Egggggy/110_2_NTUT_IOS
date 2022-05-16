//
//  SongRow.swift
//  Lab07
//
//  Created by Macbook on 2022/5/11.
//

import SwiftUI

struct SongRow:View{
    let song:Song
    var body:some View{
        HStack {
            Image(song.name)
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipped()
            VStack(alignment: .leading) {
            Text(song.name)
            Text(song.singer)
            }
            Spacer()
        }
    }
}

struct SongRow_Previews: PreviewProvider{
    static var previews: some View {
        SongRow(song: .DemoSong)
    .previewLayout(.sizeThatFits)
    }
}
