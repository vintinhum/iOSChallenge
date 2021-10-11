//
//  UIImageView.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/10/21.
//

import UIKit

extension UIImageView {
    
    static func detailPhotoImageView(width: CGFloat = 366, height: CGFloat = 250) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    static func photoCellImageView(width: CGFloat = 150, height: CGFloat = 157) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }
    
}
