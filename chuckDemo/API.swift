//
//  API.swift
//  chuckDemo
//
//  Created by William Lennartsson on 2020-02-04.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

import Foundation

struct ChuckAPI {
    let baseURL: String = "https://api.chucknorris.io/jokes/"
    
    func getRandomJoke(completion: @escaping( Result<ChuckJoke, Error>) -> Void) {
        // url
        let urlString = baseURL + "random"
        guard let url: URL = URL(string: urlString) else { return }
        // Request
        print("Creating request..")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let unwrappedError = error {
                print("Nått gick fel. Error: \(unwrappedError)")
                completion(.failure(unwrappedError))
                return
            }
            if let unwrappedData = data {
                // print("We got data! \(String(data: unwrappedData, encoding: String.Encoding.utf8) ?? "No data")")
                do {
                    let decoder = JSONDecoder()
                    let joke: ChuckJoke = try decoder.decode(ChuckJoke.self, from: unwrappedData)
                    print("Joke id: \(joke.id)")
                    print("Joke value: \(joke.value)")
                    completion(.success(joke))
                } catch {
                    print("Couldnt parse JSON..")
                }
                
            }
        }
        // Starta task
        task.resume()
        print("Task started")
    }
    
}

struct Response {
    let user: User
}
struct User {
    let bankDetails: BankDetails
}
struct BankDetails {
    
}

