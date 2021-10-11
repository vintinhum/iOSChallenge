//
//  UserViewModel.swift
//  InterChallenge
//
//  Created by Vítor Bárrios Luís de Albuquerque on 10/10/21.
//
import Alamofire
import UIKit

class UserViewModel {
    
    func fillUsers(completion: @escaping ([User]) -> ()) {
        
        AF.request("https://jsonplaceholder.typicode.com/users").validate().responseJSON { response in
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([User].self, from: data)
                    completion(models)
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
}
