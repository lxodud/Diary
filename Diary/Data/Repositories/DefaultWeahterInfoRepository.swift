//
//  DefaultWeahterInfoRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation

final class DefaultWeahterInfoRepository {
    private let networkService: APINetworkService
    
    init(networkService: APINetworkService) {
        self.networkService = networkService
    }
}

extension DefaultWeahterInfoRepository: WeatherInfoRepository {
    func fetchWeatherInfo(
        location: Location,
        completion: @escaping (Result<WeatherInfo, NetworkError>) -> Void
    ) {
        let endPoint = SearchWeatherAPI(location: location)
            
        networkService.requestData(
            endPoint: endPoint,
            type: WeatherInfoDTO.self) { result in
                switch result {
                case .success(let data):
                    completion(.success(data.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
