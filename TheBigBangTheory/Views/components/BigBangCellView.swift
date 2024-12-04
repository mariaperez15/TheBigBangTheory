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
                Text(episode.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                Text(String("Season \(episode.season) • Episode\(episode.number)"))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack(spacing: 16) {
                    ImageIconComponent(isActive: episode.isFavorite, imageActive: "star.fill", imageInactive: "star", colorActive: .yellow, colorInactive: .gray)
                    ImageIconComponent(isActive: episode.isViewed, imageActive: "eye.fill", imageInactive: "eye.slash.fill", colorActive: .blue, colorInactive: .gray)
                }
            }
            
            Spacer()
            Image(episode.image)
                .resizable() //esto incluso si no hace falta porque la imagen ya viene con el tamaño que necesitamos, hace falta?
                .scaledToFit()
                .frame(width: 130)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(radius: 3, y: 3)
        }
    }
}

#Preview {
    BigBangCellView(episode: .previewEpisode)
}
