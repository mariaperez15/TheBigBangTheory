//
//  DetailVM.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 30/11/24.
//
import Foundation

//Los viewModel tienen que ser siempre :ObservableObject o @Observable
//En realidad no estamos usando este viewModel porque por el momneto no hay nada de logica en el por lo tanto no es necesario.

final class DetailVM: ObservableObject {
    @Published var selectedEpisode: BigBangTheoryModel
    
    init(selectedEpisode: BigBangTheoryModel) {
        self.selectedEpisode = selectedEpisode
    }
}
