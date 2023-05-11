//
//  DefaultWeahterImageRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/11.
//

import Foundation

final class DefaultWeatherImageRepository {
    private let cache: CacheManager
    private let networkService: APINetworkService
    
    init(cache: CacheManager, networkService: APINetworkService) {
        self.cache = cache
        self.networkService = networkService
    }
}

extension DefaultWeatherImageRepository: WeatherImageRepository {
    func fetchWeahterImage(icon: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    }
}
