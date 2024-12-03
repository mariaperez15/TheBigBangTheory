//
//  BigBangTheoryVM.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 20/11/24.
//

import Foundation

enum FirstView {
    case loading
    case episodes
    case season
}

final class BigBangTheoryVM: ObservableObject {
    let repository: RepositoryProtocol //por que aqui hay que poner que es de tipo repository en vez de igualarlo a repository e inicializarlo?
    //let repository = Repository() -> si lo inicializo aqui, ya no hace falta hacerlo en el init. Si lo hacemos con el init, podremos inicializar otros repositorios, en vez de uno.
    
    @Published var episodes: [BigBangTheoryModel] = [] {
        didSet {
            try? repository.saveData(data: episodes)
        }
    }
    
    @Published var searchedText: String = ""
    //@Published var searchedEpisodes: [BigBangTheoryModel] = []
    @Published var firstView: FirstView = .loading
    
    var searchedResults: [BigBangTheoryModel] {
        episodes.filter { episode in
            if searchedText.isEmpty {
                firstView = .season
                return true
            } else {
                firstView = .episodes
                return episode.name.localizedCaseInsensitiveContains(searchedText)
            }
        }
    
    }
    
    var episodesFavorites: [BigBangTheoryModel] {
        episodes.filter { $0.isFavorite }
    }
            
    var seasons: [Int] {
        var seasons: [Int] = []
        episodes.forEach { episode in
            seasons.append(episode.season)
        }
        return Set(seasons).sorted()
    }
    
    
    //Esto es mejor
    var seasonsV2: [Int] {
        Set(episodes.map(\.season)).sorted() //TODO: duda keypath, equivale a :
        /*
         episodes.map { episode in episode.season } = episodes.map(\.season)
         El compilador sabe que \.season es válido porque:
             1.    episodes es un array de objetos de tipo BigBangTheoryModel.
             2.    BigBangTheoryModel tiene una propiedad llamada season.
         */
    }
    
    var seasonV3: [Int] {
        let seasons = episodes.map { episode in
            episode.season
        }
        return Set(seasons).sorted()
    }
    
    
    init(repository: RepositoryProtocol = Repository()) {
        self.repository = repository
        loadEpisodes()
    }
    
    func loadEpisodes() {
        do {
            episodes = try repository.getData()
            firstView = .season
        } catch {
            print(error)
        }
    }
    
    func episodesBySeason(season: Int) -> [BigBangTheoryModel] {
        return episodes.filter {episode in
            episode.season == season}
    }
    
    func markAsFavorite(episode: BigBangTheoryModel) {
        if let index = episodes.firstIndex(where: { chapter in
            chapter.id == episode.id }) {
            episodes[index].isFavorite.toggle()
            print("Marcado como fav")
        }
    }
    
    func searchEpisodeByName() {
        episodes.removeAll()
        episodes = episodes.filter { $0.name.localizedStandardContains(searchedText)}
        firstView = searchedText.isEmpty ? .season : .episodes
        
    }
}


