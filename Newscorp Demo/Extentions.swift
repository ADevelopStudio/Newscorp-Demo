//
//  Extentions.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func bumpAnimation() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { (completed) in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
    }
}
extension UIControl {
    func tapFeedback(isLight: Bool = true)  {
        if #available(iOS 10.0, *) {
            if !isLight {
                let impact = UIImpactFeedbackGenerator()
                impact.impactOccurred()
            }else{
                let selection = UISelectionFeedbackGenerator()
                selection.selectionChanged()
            }
        }
    }
}

extension UIViewController {
        func showError(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
