//
//  Newscorp_DemoTests.swift
//  Newscorp DemoTests
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import XCTest
@testable import Newscorp_Demo

class Newscorp_DemoTests: XCTestCase {
    func testGameProgressMethods() {
        let gameData = GameData(product: "For testing", resultSize: 10, version: -10, items: [])
        var gameProgress = GameProgress(gameData)
        gameProgress.clear()
        gameProgress.update(with: .won)
        XCTAssertEqual(gameProgress.currentScore, 1)
        gameProgress.update(with: .skipped)
        XCTAssertEqual(gameProgress.currentScore, 1)
        gameProgress.update(with: .lost)
        XCTAssertEqual(gameProgress.currentScore, 0)
        gameProgress.update(with: .lost)
        XCTAssertEqual(gameProgress.currentScore, -1)

        let loadedProgress = GameProgress(gameData)
        XCTAssertEqual(loadedProgress.currentScore, gameProgress.currentScore)
    }
    
    func testLoadingAndDecodingJson()  {
        XCTAssertNotNil(Database(jsonFileName: "game"))
    }
    
}
