//
//  ViewedCellView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 3/12/24.
//

import SwiftUI

struct ViewedCellView: View {
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
            Image(systemName: episode.isViewed ? "eye.fill" : "eye.slash.fill")
                .foregroundStyle(episode.isViewed ? .blue : .gray)
        }
    }
}

#Preview {
    ViewedCellView(episode: .previewEpisode)
}
