//
//  RestAPI.swift
//  AREA
//
//  Created by Eli Allen on 1/17/22.
//

import Foundation

struct RestAPI {
    static func getData<T:Codable>(from request: String, as dataType: T.Type, then completionHandler: @escaping (T) -> Void ){
        let url = URL(string: request)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(String(describing: response))")
                      return
                  }
                        
            if let data = data,
               let decodedData = try? JSONDecoder().decode(dataType, from: data) {
                    completionHandler(decodedData)
            }else{
                print("Error: Could not decode JSON! See the following expect data structure:")
                print(String(describing: dataType))
            }
        })
        task.resume()
    }
}

