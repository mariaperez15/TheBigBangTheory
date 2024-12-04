//
//  ViewedEpisodesView.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 3/12/24.
//

import SwiftUI

struct ViewedEpisodesView: View {
    @EnvironmentObject var vm: BigBangTheoryVM
    
    var body: some View {
        NavigationStack {
            if vm.episodesViewed.isEmpty{
                Text("There are not viewed episodes")
            } else {
                viewedList
            }
        }
    }
    
    var viewedList: some View {
        List(vm.episodesViewed) { episode in
            NavigationLink(value: episode) {
                BigBangCellView(episode: episode)
                    .viewedSwipeModifiers(episode: episode)
            }
        }
        .navigationTitle("Viewed episodes")
        .navigationDestination(for: BigBangTheoryModel.self) { episode in
            BigBangDetailView(episode: episode)
        }
    }
}

#Preview {
    ViewedEpisodesView()
        .environmentObject(BigBangTheoryVM())
}
