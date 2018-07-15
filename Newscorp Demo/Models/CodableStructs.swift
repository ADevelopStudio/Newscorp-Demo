//
//  Structs.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

struct GameData: Codable {
    var product: String
    var resultSize: Int
    var version: Int
    var items: [Question]
}

struct Question: Codable {
    enum Result {
        case won, lost, skipped
        var buttonColor: UIColor {
            switch self {
            case .lost:
                return .red
            case .won:
                return .green
            case .skipped:
                return .white
            }
        }
    }
    var correctAnswerIndex: Int
    var imageUrl: String
    var standFirst: String
    var storyUrl: String
    var section: String
    var headlines: [String]
    
    func result(for index: Int) -> Question.Result {
        if index < 0 {return .skipped}
        return index == correctAnswerIndex ? .won : .lost
    }
}
