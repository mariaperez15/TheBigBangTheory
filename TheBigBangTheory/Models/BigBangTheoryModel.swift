//
//  BigBangTheoryModel.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 27/11/24.
//

import Foundation

struct BigBangTheoryModel: Codable, Identifiable, Hashable {
    let id: Int
    let url: URL
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let runtime: Int
    let image: String
    let summary: String
    var isFavorite: Bool
    var isViewed: Bool
    var episodeNotes: String
    var rating: Int
}
