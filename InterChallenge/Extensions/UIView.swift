//
//  UIView.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/10/21.
//

import UIKit

extension UIView {
    
    static func separatorView(heigth: CGFloat = 157, width: CGFloat = 2) -> UIView {
        let view = UIView()
        
        view.frame = CGRect(x: 0, y: 0, width: width, height: heigth)
        view.backgroundColor = .lightGray
        
        return view
    }
}
