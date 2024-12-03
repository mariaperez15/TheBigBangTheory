//
//  BigBangDetailView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 20/11/24.
//

import SwiftUI

struct BigBangDetailView: View {
    @EnvironmentObject var vm: BigBangTheoryVM
    @State var episode: BigBangTheoryModel
    
    var body: some View {
        ScrollView {
            VStack {
                Image(episode.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                VStack {
                    Text(episode.name)
                        .bold()
                        .font(.largeTitle)
                        .padding()
                    Text(episode.summary)
                    Link(destination: episode.url) {
                        Text("+ info")
                    }
                }
                .padding()
                
                Button {
                    vm.markAsFavorite(episode: episode)
                    episode.isFavorite.toggle()
                } label: {
                    Image(systemName: episode.isFavorite ? "star.fill" : "star")
                        .foregroundColor(episode.isFavorite ? .yellow : .gray)
                }
            }
        }
    }
}

#Preview {
    BigBangDetailView(episode: .previewEpisode)
        .environmentObject(BigBangTheoryVM.preview)
}
