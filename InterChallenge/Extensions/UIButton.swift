//
//  UIButton.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/10/21.
//

import UIKit

extension UIButton {
    
    static func userCellButton(title: String) -> UIButton {
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 36)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = nil
        
        button.isUserInteractionEnabled = true
        
        return button
    }
    
}
