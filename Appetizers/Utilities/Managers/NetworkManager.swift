//
//  NetworkManager.swift
//  Appetizers
//
//  Created by sanwar on 31/07/24.
//

import Foundation
import UIKit

final class NetworkManager{
    static let networkManagerInstance=NetworkManager()
    let cache=NSCache<NSString,UIImage>()
    
    static let baseURL="https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals"
     let appetizersURL=baseURL+"/appetizers"
    
    func getAppetizers(completed : @escaping( Result<[Appetizer],APError>)->Void)
    {
        guard let url=URL(string: appetizersURL) else{
            return completed(.failure(.invalidURL))
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _=error{
                completed(.failure(.unableToComplete))
            }
            
            guard let response=response as? HTTPURLResponse ,response.statusCode==200 else{
                return completed(.failure(.invalidResponse))
                
            }
            
            guard let data=data else{
               return completed(.failure(.invalidData))
            }
            
            do{
                
                let decodedResponse=try JSONDecoder().decode(AppetizerRequest.self,from: data)
                completed(.success(decodedResponse.request))
            } catch{
                return completed(.failure(.invalidData))

            }
        }
        task.resume()
        
    }
    
    func downloadImage(imageUrlString urlString:String,completed:@escaping(UIImage?)->Void){
        if let image=cache.object(forKey: NSString(string: urlString)){
            completed(image)
        }
        guard let url=URL(string: urlString) else{
            return completed(nil)
        }
        
        let task=URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data=data, let image = UIImage(data: data) else{
                return completed(nil)
            }
            self.cache.setObject(image, forKey:  NSString(string: urlString))
            completed(image)
        }
        task.resume()
    }
    
}
