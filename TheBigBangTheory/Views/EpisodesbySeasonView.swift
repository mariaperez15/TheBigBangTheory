//
//  HomeTabView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 20/11/24.
//

import SwiftUI

struct EpisodesbySeasonView: View {
    let selectedSeason: Int
    @EnvironmentObject private var vm: BigBangTheoryVM
    
    var body: some View {        
        List(vm.episodesBySeason(season: selectedSeason)) { episode in
            NavigationLink(value: episode) {
                BigBangCellView(episode: episode)
            }
            .favoriteSwipe(episode: episode)
            .viewedSwipeModifiers(episode: episode)
        }
        .navigationTitle("Season \(selectedSeason)")
        .toolbar {
            ToolbarItem {
                Button {
                    vm.markSeasonAsViewed(seasonNumber: selectedSeason)
                } label: {
                    Image(systemName: "eye")
                }

            }
        }
    }
}

#Preview {
    NavigationStack {
        EpisodesbySeasonView(selectedSeason: 1)
            .environmentObject(BigBangTheoryVM.preview)
    }
}
