//
//  CacheWeatherImageStorage.swift
//  Diary
//
//  Created by 이태영 on 2023/05/11.
//

import Foundation

final class CacheWeatherImageStorage {
    private let cacheManager: CacheManager
    
    init(cacheManager: CacheManager = CacheManager.shared) {
        self.cacheManager = cacheManager
    }
}

extension CacheWeatherImageStorage: WeatherImageStorage {
    func fetchWeatherImage(key: String?, completion: @escaping (Result<Data, CacheError>) -> Void) {
        guard let data = cacheManager.readMemory(key: key)?.imageData else {
            completion(.failure(.failToLoad))
            return
        }
        
        completion(.success(data))
    }
    
    func save(key: String?, data: Data) {
    }
}
