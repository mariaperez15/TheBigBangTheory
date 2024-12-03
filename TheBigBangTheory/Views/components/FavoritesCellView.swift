//
//  FavoritesCellView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 30/11/24.
//

import SwiftUI

struct FavoritesCellView: View {
    let episode: BigBangTheoryModel
    
    var body: some View {
        VStack {
            Image(episode.image)
                .resizable() //esto incluso si no hace falta porque la imagen ya viene con el tamaño que necesitamos, hace falta?
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 6)
            HStack{
                Text(episode.name)
                    .bold()
                    .font(.title)
                Image(systemName: episode.isFavorite ? "star.fill" : "star")
                    .foregroundStyle(episode.isFavorite ? .yellow : .gray)
            }
        }
    }
}

#Preview {
    FavoritesCellView(episode: .previewEpisode)}
