//
//  EpisodesFavoritesView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 30/11/24.
//

import SwiftUI

struct EpisodesFavoritesView: View {
    @EnvironmentObject var vm: BigBangTheoryVM
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.episodesFavorites.isEmpty {
                    Text("There are not favorites episodes")
                } else {
                    favoritesList
                }
            }
            .navigationTitle("Favorites episodes")
            .navigationDestination(for: BigBangTheoryModel.self) { episode in
                BigBangDetailView(episode: episode)
            }
        }
    }
    var favoritesList: some View {
        List(vm.episodesFavorites) { episode in
            NavigationLink(value: episode) {
                FavoritesCellView(episode: episode)
                    .favoriteSwipe(episode: episode)
                    //.modifier(FavoritesSwipeModifiers(episode: episode))
            }
        }
    }
}

#Preview {
    EpisodesFavoritesView()
        .environmentObject(BigBangTheoryVM())
}
