//
//  APIClient.swift
//  PinterestClone
//
//  Created by Rinni Swift on 12/19/18.
//  Copyright © 2018 Rinni Swift. All rights reserved.
//

import Foundation

enum Either<T> {
    case success(T)
    case error(Error)
}

protocol APIClient {
    var session: URLSession { get }
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void )
}

extension APIClient {
    func get<T: Codable>(with request: URLRequest, completion: @escaping (Either<[T]>) -> Void ) {
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.error(error!))
                return
            }

            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                print("Error: with response")
                return
            }

            guard let value = try? JSONDecoder().decode([T].self, from: data!) else {
                print("Decoder error")
                return
            }
            DispatchQueue.main.async {
                completion(.success(value))
            }
        }
        task.resume()
    }
}
