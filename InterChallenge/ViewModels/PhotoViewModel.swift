//
//  PhotoViewModel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 10/10/21.
//

import Alamofire
import UIKit

class PhotoViewModel {
    
    func fillPhotos(from albumId: Int, completion: @escaping ([Photo]) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)").validate().responseJSON { response in
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Photo].self, from: data)
                    completion(models)
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
}
