//
//  DefaultWeahterInfoRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation

final class DefaultWeahterInfoRepository {
    private let networkService: APINetworkService
    private let decoder = JSONDecoder()
    
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
            endPoint: endPoint) { result in
                switch result {
                case .success(let data):
                    guard let decodedData = try? self.decoder.decode(WeatherInfoDTO.self, from: data) else {
                        completion(.failure(.parsingError))
                        return
                    }
                    
                    completion(.success(decodedData.toDomain()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
