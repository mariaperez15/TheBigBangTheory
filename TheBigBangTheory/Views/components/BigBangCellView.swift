//
//  BigBangCellView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 20/11/24.
//

import SwiftUI

struct BigBangCellView: View {
    let episode: BigBangTheoryModel
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Title: \(episode.name)")
                Text(String("Season: \(episode.season)"))
                Text(String("Episode:\(episode.number)"))
            }
            
            Spacer()
            Image(episode.image)
                .resizable() //esto incluso si no hace falta porque la imagen ya viene con el tamaño que necesitamos, hace falta?
                .scaledToFit()
                .frame(width: 150)
            Image(systemName: episode.isFavorite ? "star.fill" : "star")
                .foregroundStyle(episode.isFavorite ? .yellow : .gray)
        }
    }
}

#Preview {
    BigBangCellView(episode: BigBangTheoryModel(id: 2913, url: URL(filePath: "https://www.tvmaze.com/episodes/2913/the-big-bang-theory-1x01-pilot")!, name: "Pilot", season: 1, number: 1, airdate: "2007-09-24", runtime: 30, image: "12368", summary: "Is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard's roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow Cal Tech scientists Wolowitz and Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.\n", isFavorite: false))
}
