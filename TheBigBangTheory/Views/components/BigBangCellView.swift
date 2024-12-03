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
    BigBangCellView(episode: .previewEpisode)
}
