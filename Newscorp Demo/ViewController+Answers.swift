//
//  ViewController+Answers.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit
extension ViewController: AnswersStackViewDelegate {
    func playerAnswered(question:  Question, with result: Question.Result){
        switch result {
        case .won:
            break
        case .lost:
            break
        case .skipped:
            break
        }
    }
}
