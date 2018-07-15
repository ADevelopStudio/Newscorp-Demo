//
//  GameProgress.swift
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
    
    private init(gameVersion: Int) {
        guard let savedData = UserDefaults.standard.object(forKey: "SavedResult\(gameVersion)") as? Data,
            let progress  = try? JSONDecoder().decode(GameProgress.self, from: savedData) else {
                self.productVersion = gameVersion
                return
        }
        self = progress
    }
    
    init(_ gameData: GameData) {
        self.init(gameVersion: gameData.version)
    }
    
    func save() {
        UserDefaults.standard.set(try? JSONEncoder().encode(self), forKey: "SavedResult\(self.productVersion)")
    }
    
    
    mutating func update(with result: Question.Result)  {
        switch result {
        case .lost:
            self.currentScore -= 1
        case .won:
            self.currentScore += 1
        case .skipped:
            break
        }
        self.currentQuestionNumber += 1
        self.save()
    }
    
    mutating func clear()  {
        UserDefaults.standard.removeObject(forKey: "SavedResult\(self.productVersion)")
        self.currentScore = 0
        self.currentQuestionNumber = 0
    }
}
