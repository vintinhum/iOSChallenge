//
//  UILabel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/10/21.
//

import UIKit

extension UILabel {
    
    static func regularLabel(_ size: CGFloat = 17.0, textColor: UIColor = .black, numberOfLines: Int = 1) -> UILabel {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.frame = CGRect(x: 0, y: 0, width: 258, height: 20.33)
        
        return label
    }
    
    static func regularLabelWithBackground(_ size: CGFloat = 17.0, textColor: UIColor = .black, numberOfLines: Int = 1, backgroundColor: UIColor = .systemYellow) -> UILabel {
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 88, height: 88)
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.backgroundColor = backgroundColor
        label.textAlignment = .center
        
        return label
    }
    
    static func titleLabel(_ size: CGFloat = 21.0, textColor: UIColor = .black, numberOfLines: Int = 1) -> UILabel {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: size)
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.textAlignment = .left
        
        return label
        
    }
    
   
    
}
