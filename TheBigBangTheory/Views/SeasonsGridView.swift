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
                    searchedEpidodes
                case .season:
                    seasonsGrid
                }
                //ContentUnavailableView utilizarlo para que cuando no encuentre nada que coincida con la busqueda
            }
            .searchable(text: $vm.searchedText , prompt: "Search season by title")
            .onChange(of: vm.searchedText) {
                if vm.searchedText.isEmpty {
                    vm.firstView = .season
                } else {
                    vm.firstView = .episodes
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
    
    var seasonsGrid: some View {
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
    
    var searchedEpidodes: some View {
        List(vm.searchedResults) { episode in
            NavigationLink(value: episode) {
                BigBangCellView(episode: episode)
            }
            .favoriteSwipe(episode: episode)
        }
    }
}



#Preview {
    SeasonsGridView()
        .environmentObject(BigBangTheoryVM.preview)
}
