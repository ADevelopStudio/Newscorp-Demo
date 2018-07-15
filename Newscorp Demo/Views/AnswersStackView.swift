//
//  AnswersStackView.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import UIKit

protocol AnswersStackViewDelegate: class{
    func playerAnswered(question:  Question, with result: Question.Result)
}

class AnswersStackView: UIStackView {
    var question:  Question?
    var delegate:  AnswersStackViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func createBtn(title: String, index: Int) -> UIView {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = title
        label.tag = index
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.setRoundCorners()
        label.backgroundColor = .white
        label.isUserInteractionEnabled = true
        label.isMultipleTouchEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.optionChoosen(tap:))))
        return label
    }
    
    func setViewWith(question:  Question, delegate:  AnswersStackViewDelegate)  {
        self.question = question
        self.delegate = delegate
        self.arrangedSubviews.forEach({$0.removeFromSuperview()})
        question.headlines.enumerated().forEach({
            self.addArrangedSubview(self.createBtn(title: $0.element, index: $0.offset))
        })
        self.addArrangedSubview(self.createBtn(title: "Skip this question", index: -1))
    }
    
    @objc func optionChoosen(tap: UITapGestureRecognizer)  {
        guard let index = tap.view?.tag, let question = question else {return}
        delegate?.playerAnswered(question: question, with: question.result(for: index))
    }
}
