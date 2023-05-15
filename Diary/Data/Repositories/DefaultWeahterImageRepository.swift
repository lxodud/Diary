//
//  DefaultWeahterImageRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/11.
//

import Foundation

final class DefaultWeatherImageRepository {
    private let cache: WeatherImageStorage
    private let networkService: APINetworkService
    
    init(cache: WeatherImageStorage, networkService: APINetworkService) {
        self.cache = cache
        self.networkService = networkService
    }
}

extension DefaultWeatherImageRepository: WeatherImageRepository {
    func fetchWeahterImage(icon: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        cache.fetchWeatherImage(key: icon) { result in
            if case .success(let data) = result {
                completion(.success(data))
                return
            }

            let endPoint = ImageLoadAPI(icon: icon)
            self.networkService.requestData(endPoint: endPoint) { result in
                switch result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
