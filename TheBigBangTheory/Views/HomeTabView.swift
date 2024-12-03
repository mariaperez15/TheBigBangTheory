//
//  TabViewComponent.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 27/11/24.
//

import SwiftUI

struct HomeTabView: View {

    var body: some View {
        TabView {
            Tab {
                SeasonsGridView()
                //Text("Hola")
            } label: {
                Image(systemName: "square")
            }
            Tab {
                EpisodesFavoritesView()
            } label: {
                Image(systemName: "star")
                    
            }


        }
    }
}

#Preview {
    HomeTabView()
        .environmentObject(BigBangTheoryVM.preview)
}
