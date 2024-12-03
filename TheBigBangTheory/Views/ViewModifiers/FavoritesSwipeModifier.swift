//
//  FavoritesSwipeModifier.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 30/11/24.
//

import SwiftUI

struct FavoritesSwipeModifiers: ViewModifier {
    @EnvironmentObject var vm: BigBangTheoryVM
    let episode: BigBangTheoryModel
    
    func body(content: Content) -> some View {
        content
            .swipeActions {
                Button {
                    vm.markAsFavorite(episode: episode)
                } label: {
                    Image(systemName: episode.isFavorite ? "star.fill" : "star")
                }
                .tint(episode.isFavorite ? .yellow : .gray)
            }
    }
}

extension View {
    func favoriteSwipe(episode: BigBangTheoryModel) -> some View {
        modifier(FavoritesSwipeModifiers(episode: episode))
    }
}
