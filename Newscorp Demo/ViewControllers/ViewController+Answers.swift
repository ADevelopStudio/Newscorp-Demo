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
    func playerAnswered(with result: Question.Result){
        database?.progress.update(with: result)
        self.updateProgressLabels()
        self.displayNextQuestion()
    }
}
