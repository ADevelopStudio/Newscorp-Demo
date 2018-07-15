//
//  ViewController.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultBtn: UIBarButtonItem!
    @IBOutlet weak var answersStackView: AnswersStackView!
    
    let gameData = Database()?.gameData
    var progress: GameProgress?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress = GameProgress(gameData)
        self.title = gameData?.product ?? "GameData not found"
        self.resultAndNextQuestion()
    }
    
    
    
    func resultAndNextQuestion() {
        guard let progress = progress, let gameData = gameData else{
            resultBtn.isEnabled = false
            resultBtn.tintColor = .clear
            return
        }
        resultBtn.title = "Result: \(progress.currentScore)"

        guard let nextQuestion = gameData.nextQuestion(after: progress.currentQuestionNumber) else{
            //NO MORE QUESTIONS
            return
        }
        
        answersStackView.setViewWith(question: nextQuestion, delegate: self)
    }
    
    @IBAction func resultPressed(_ sender: Any) {
    }
    
}

