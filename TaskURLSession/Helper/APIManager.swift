//
//  APIManager.swift
//  TaskURLSession
//
//  Created on 16/01/24.
//

import Foundation

class APIManager{
    
    static let shared = APIManager()
    
    func getData(completionBlock: @escaping ([DataModel]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response.debugDescription)")
                return
            }
            if let data = data{
                do {
                    let jsonData = try JSONDecoder().decode([DataModel].self, from: data)
                    completionBlock(jsonData)
                }
                catch let error as NSError {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
