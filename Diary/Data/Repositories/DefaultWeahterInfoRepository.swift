//
//  DefaultWeahterInfoRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/10.
//

import Foundation

final class DefaultWeahterInfoRepository {
    
}

extension DefaultWeahterInfoRepository: WeatherInfoRepository {
    func fetchWeatherInfo(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
    }
}
