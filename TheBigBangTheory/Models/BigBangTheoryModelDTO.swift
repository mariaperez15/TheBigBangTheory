//
//  BigBangTheoryModel.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 19/11/24.
//

import Foundation

struct BigBangTheoryModelDTO: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    
    var mapToModel: BigBangTheoryModel {
        BigBangTheoryModel(
            id: id,
            url: url,
            name: name,
            season: season,
            number: number,
            airdate: airdate,
            runtime: runtime,
            image: image,
            summary: summary,
            isFavorite: false,
            isViewed: false
        )
    }
}

