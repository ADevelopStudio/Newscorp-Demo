//
//  Extentions.swift
//  Newscorp Demo
//
//  Created by Dmitrii Zverev on 15/7/18.
//  Copyright © 2018 Dmitrii Zverev. All rights reserved.
//

import Foundation
import UIKit

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UIImageView {
    func loadWith(urlString: String)  {
        self.image = nil
        guard let url = URL(string: urlString) else {
            self.setErrorImage()
            return
        }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url),  let image = UIImage(data: data) else {
                DispatchQueue.main.async {self.setErrorImage()}
                return
            }
            DispatchQueue.main.async {self.image = image}
        }
    }
    
    private func setErrorImage(){
        self.image = #imageLiteral(resourceName: "image-not-found")
    }
}

extension UIBarButtonItem {
    func hide()  {
        self.tintColor = .clear
        self.isEnabled = false
    }
}

extension UIView {
    func bumpAnimation(for result: Question.Result, completion: @escaping ()->()) {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundColor = result.buttonColor
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _  in
            UIView.animate(withDuration: 0.3, animations:{
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { _ in completion()}
        }
    }
    
    func setRoundCorners(cornerRadius: CGFloat = 7, borderWidth: CGFloat = 0, borderColor: UIColor = .clear)  {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = true
    }
}


extension UIViewController {
        func showError(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
