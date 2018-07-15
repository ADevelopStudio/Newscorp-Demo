//
//  ViewController.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let database = Database()
    var progress: GameProgress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress = GameProgress(gameData: database?.gameData)
        self.title = database?.gameData.product ?? "GameData not found"
    }
}

