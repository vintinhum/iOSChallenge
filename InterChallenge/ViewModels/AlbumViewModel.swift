//
//  AlbumViewModel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 10/10/21.
//
import Alamofire
import UIKit

class AlbumViewModel {
    
    func fillAlbums(from userId: Int, completion: @escaping ([Album]) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/albums?userId=\(userId)").validate().responseJSON { response in
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Album].self, from: data)
                    completion(models)
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
}
