//
//  PostViewModel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 10/10/21.
//

import Alamofire
import UIKit

class PostViewModel {
    
    func fillPosts(from userId: Int, completion: @escaping ([Post]) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/posts?userId=\(userId)").validate().responseJSON { response in
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Post].self, from: data)
                    completion(models)
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
}
