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
                    iconsApp(isActive: episode.isFavorite, imageActive: "star.fill", imageInactive: "star", colorActivate: .yellow, colorInactive: .gray)
                    iconsApp(isActive: episode.isViewed, imageActive: "eye.fill", imageInactive: "eye.slash.fill", colorActivate: .blue, colorInactive: .gray)
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
    
    func iconsApp(isActive: Bool, imageActive: String, imageInactive: String, colorActivate: Color, colorInactive: Color) -> some View {
        Image(systemName: isActive ? imageActive : imageInactive)
            .foregroundColor(isActive ? colorActivate : colorInactive)
            .frame(width: 32, height: 32)
            .background(
                Circle()
                    .fill(Color(.systemGray6))
                    .opacity(0.7)
            )
    }
}

#Preview {
    BigBangCellView(episode: .previewEpisode)
}
