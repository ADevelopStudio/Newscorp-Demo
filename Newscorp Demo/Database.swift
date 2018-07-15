//
//  Database.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation



struct Database {
    var gameData: GameData
    
    init?(jsonFileName: String = "game") {
        guard let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json") else {return nil}
        guard let data = try? Data(contentsOf: url), let jsonData = try? JSONDecoder().decode(GameData.self, from: data) else {return nil}
        gameData =  jsonData
    }
}
