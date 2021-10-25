//
//  MainCoordinator.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 13/10/21.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
// MARK: - Main Screen
    func start() {
        var challengeVC: UITableViewController & Coordinating = ChallengeViewController()
        challengeVC.coordinator = self
        navigationController?.setViewControllers([challengeVC], animated: false)
    }

// MARK: - Albums scene
    func goToAlbums(userId: Int, userName: String) {
        var albumVC: UITableViewController & Coordinating = AlbumTableViewController(userId: userId, userName: userName)
        albumVC.coordinator = self
        navigationController?.pushViewController(albumVC, animated: true)
    }
    
    func goToPhotos(albumId: Int, userName: String) {
        var photoVC: UITableViewController & Coordinating = PhotoTableViewController(albumId: albumId, userName: userName)
        photoVC.coordinator = self
        navigationController?.pushViewController(photoVC, animated: true)

    }
    
    func goToDetails(photo: UIImage, name: String) {
        var detailVC: UIViewController & Coordinating = DetailsViewController(photo: photo, name: name)
        detailVC.coordinator = self
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
// MARK: - Posts scene
    func goToPosts(userId: Int, userName: String) {
        var postVC: UITableViewController & Coordinating = PostTableViewController(userId: userId, userName: userName)
        postVC.coordinator = self
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    func goToComments(postId: Int, userName: String) {
        var commentVC: UITableViewController & Coordinating = CommentTableViewController(userName: userName, postId: postId)
        commentVC.coordinator = self
        navigationController?.pushViewController(commentVC, animated: true)
    }
}
