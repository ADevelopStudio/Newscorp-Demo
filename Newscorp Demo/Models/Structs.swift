//
//  Structs.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation


struct GameProgress: Codable {
    var productVersion: Int = 0
    var currentScore: Int = 0
    var currentQuestionNumber: Int = 0
    
    init?(gameVersion: Int?) {
        guard let gameVersion = gameVersion else {return nil}
        guard let savedData = UserDefaults.standard.object(forKey: "SavedResult\(gameVersion)") as? GameProgress else {return}
        self = savedData
    }
    init?(gameData: GameData?) {
        self.init(gameVersion: gameData?.version)
    }
    
    func save() {
        UserDefaults.standard.set(self, forKey: "SavedResult\(self.productVersion)")
    }
}


struct GameData: Codable {
    var product: String
    var resultSize: Int
    var version: Int
    var items: [Question]
}


struct Question: Codable {
    var correctAnswerIndex: Int
    var imageUrl: String
    var standFirst: String
    var storyUrl: String
    var section: String
    var headlines: [String]
}
