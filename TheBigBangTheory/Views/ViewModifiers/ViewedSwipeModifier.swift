//
//  ViewedSwipeModifier.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 3/12/24.
//

import SwiftUI

struct ViewedSwipeModifiers: ViewModifier {
    @EnvironmentObject var vm: BigBangTheoryVM
    let episode: BigBangTheoryModel
    
    func body(content: Content) -> some View {
        content
            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                Button {
                    vm.markAsViewed(episode: episode)
                } label: {
                    Image(systemName: episode.isViewed ? "eye.fill" : "eye.slash.fill")
                }
                .tint(episode.isViewed ? .blue : .gray)
            }
    }
    
}

extension View {
    func viewedSwipeModifiers(episode: BigBangTheoryModel) -> some View {
        modifier(ViewedSwipeModifiers(episode: episode))
    }
}
