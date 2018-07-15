
//
//  ViewController+AlertDialogs.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

extension ViewController {
    @IBAction func resultPressed(_ sender: Any) {
        self.showResults()
    }
    @IBAction func progressPressed(_ sender: Any) {
        self.showResults()
    }
    
    @IBAction func showArticlePressed(_ sender: Any) {
        guard let urlString = database?.currentQuestion()?.storyUrl, let url = URL(string: urlString)  else {
            self.showError("Invalid URL")
            return
        }
        self.present(SFSafariViewController(url: url), animated: true, completion: nil)
    }
    
    
    func showResults() {
        guard let database = database else {return}
        let alert = UIAlertController(title: database.gameData.product, message: "You played \(database.progress.currentQuestionNumber) out of \(database.gameData.items.count) questions\nYou result is \(database.progress.currentScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset result", style: .destructive, handler: { (_) in
            self.database?.progress.clear()
            self.displayNextQuestion()
            self.updateProgressLabels()
        }))
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showEndOfGame() {
        self.database?.progress.clear()
        self.updateProgressLabels()
        self.displayNextQuestion()
        guard let database = database else {return}
        let alert = UIAlertController(title: database.gameData.product, message: "Quiz Completed.\nYou result is \(database.progress.currentScore)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
