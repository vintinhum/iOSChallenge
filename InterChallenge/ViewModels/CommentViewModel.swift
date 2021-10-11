//
//  CommentViewModel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 10/10/21.
//

import Alamofire
import UIKit

class CommentViewModel {
    
    func fillComments(from postId: Int, completion: @escaping ([Comment]) -> ()) {
        AF.request("https://jsonplaceholder.typicode.com/comments?postId=\(postId)").validate().responseJSON { response in
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Comment].self, from: data)
                    completion(models)
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
}
