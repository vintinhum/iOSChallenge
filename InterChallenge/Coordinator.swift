//
//  Coordinator.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 13/10/21.
//

import UIKit


protocol Coordinator {
    var navigationController: UINavigationController?  { get set }
    
    func start()
    
    func goToAlbums(userId: Int, userName: String)
    func goToPosts(userId: Int, userName: String)
    func goToPhotos(albumId: Int, userName: String)
    func goToDetails(photo: UIImage, name: String)
    func goToComments(postId: Int, userName: String)
}
    
protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
