//
//  SeasonsGridView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 26/11/24.
//

import SwiftUI

struct SeasonsGridView: View {
    @EnvironmentObject private var vm: BigBangTheoryVM
    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                switch vm.firstView {
                case .loading:
                    ProgressView()
                case .episodes:
                    searchedEpidodes()
                case .season:
                    seasonsGrid()
                }
            }
            .searchable(text: $vm.searchedText , prompt: "Search season by title")
            .onChange(of: vm.searchedText) {
                Task {
                    //vm.searchEpisodeByName()
                }
            }
            .navigationTitle("Seasons")
            .navigationDestination(for: Int.self) { season in
                EpisodesbySeasonView(selectedSeason: season)
            }
            .navigationDestination(for: BigBangTheoryModel.self) { episode in
                BigBangDetailView(episode: episode)
            }
        }
    }
    
    func seasonsGrid() -> some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(vm.seasons, id: \.self) { season in
                    NavigationLink(value: season) {
                        Image("season\(season)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 195)
                            .cornerRadius(6)
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
    
    func searchedEpidodes() -> some View {
        List(vm.episodes) { episode in
            NavigationLink(value: episode) {
                BigBangCellView(episode: episode)
            }
            //Añadir el añadir a favoritos
            .favoriteSwipe(episode: episode)
        }
    }
}



#Preview {
    SeasonsGridView()
        .environmentObject(BigBangTheoryVM.preview)
}
