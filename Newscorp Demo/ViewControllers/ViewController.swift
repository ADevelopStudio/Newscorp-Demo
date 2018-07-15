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
    @IBOutlet weak var progressBtn: UIBarButtonItem!
    @IBOutlet weak var answersStackView: AnswersStackView!
    @IBOutlet weak var articleImageview: UIImageView!
    @IBOutlet weak var standfirstLabel: UILabel!
    
    var database = Database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = database?.gameData.product ?? "GameData not found"
        self.displayNextQuestion()
        self.updateProgressLabels()
    }
    
    
    func updateProgressLabels()  {
        guard let database = database else{
            [resultBtn, progressBtn].forEach({$0?.hide()})
            return
        }
        resultBtn.title =  database.resultText
        progressBtn.title =  database.progressText
    }

    func displayNextQuestion() {
        guard let database = database else {
            self.showError("Game file not found")
            return
        }
        guard let nextQuestion = database.currentQuestion() else {
            if database.gameData.items.isEmpty {
                self.showError("No questions found for this game")
            } else {
                self.showEndOfGame()
            }
            return
        }
        
        answersStackView.setViewWith(question: nextQuestion, delegate: self)
        articleImageview.loadWith(urlString: nextQuestion.imageUrl)
        standfirstLabel.text = nextQuestion.standFirst

        UIView.animate(withDuration: 0.3) {
            self.standfirstLabel.updateConstraints()
            self.standfirstLabel.layoutIfNeeded()
        }
    }
    
}

