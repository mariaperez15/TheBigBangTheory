//
//  Repository.swift
//  TheBigBangTheory
//
//  Created by María Pérez  on 19/11/24.
//

import Foundation

protocol RepositoryProtocol {
    var url: URL { get }
    var savedURL: URL { get }
    func getData() throws -> [BigBangTheoryModel]
    func saveData(data: [BigBangTheoryModel]) throws
}

struct Repository: RepositoryProtocol {
    var url = Bundle.main.url(forResource: "BigBang", withExtension: "json")!
    var savedURL = URL.documentsDirectory.appending(path: "savedEpisodes.json")
    
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
        print(savedURL)
        try data.write(to: savedURL, options: [.atomic, .completeFileProtection])
    }
}
