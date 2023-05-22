//
//  NetworkManager.swift
//  Diary
//
//  Copyright (c) 2023 Minii All rights reserved.

import Foundation

protocol NetworkService { }

protocol APINetworkService: NetworkService {
    func requestData(
        endPoint: Requestable,
        completion: @escaping (Result<Data, Error>) -> Void
    )
}

extension APINetworkService {
    func requestData(
        endPoint: Requestable,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        guard let request = endPoint.convertURL() else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(NetworkError.transportError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.translateResponseError))
                return
            }
            
            guard (200...299) ~= response.statusCode else {
                completion(.failure(NetworkError.serverError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.transportError))
                return
            }

            completion(.success(data))
        }
        
        task.resume()
    }
}

struct NetworkManager: APINetworkService { }
