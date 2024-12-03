//
//  PreviewData.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 30/11/24.
//

import Foundation



struct RepositoryPreviewData: RepositoryProtocol {
    var url:URL = Bundle.main.url(forResource: "BigBangTest", withExtension: "json")!
    var savedURL: URL = URL.documentsDirectory.appending(path: "savesEpisodesTest.json")
    
    func getData() throws -> [BigBangTheoryModel] {
        if FileManager.default.fileExists(atPath: savedURL.path()) {
            let data = try Data(contentsOf: savedURL)
            return try JSONDecoder().decode([BigBangTheoryModel].self, from: data)
        } else {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([BigBangTheoryModelDTO].self, from: data).map { $0.mapToModel }
        }
    }
    
    func saveData(data: [BigBangTheoryModel]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(data)
        try data.write(to: savedURL, options: [.atomic, .completeFileProtection])
    }
}

extension BigBangTheoryVM {
    static let preview = BigBangTheoryVM(repository: RepositoryPreviewData())
}

extension BigBangTheoryModel {
   static let previewEpisode = BigBangTheoryModel(id: 1, url: URL(string: "https://www.tvmaze.com/episodes/2913/the-big-bang-theory-1x01-pilot")! , name: "Pilot", season: 1, number: 1, airdate: "2007-09-24", runtime: 30, image: "12368", summary: "Is a comedy about brilliant physicists, Leonard and Sheldon, who are the kind of \"beautiful minds\" that understand how the universe works. But none of that genius helps them interact with people, especially women. All this begins to change when a free-spirited beauty named Penny moves in next door. Sheldon, Leonard's roommate, is quite content spending his nights playing Klingon Boggle with their socially dysfunctional friends, fellow Cal Tech scientists Wolowitz and Koothrappali. However, Leonard sees in Penny a whole new universe of possibilities... including love.\n", isFavorite: false)
}

  
