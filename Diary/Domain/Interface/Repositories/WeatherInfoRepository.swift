//
//  WeatherRepository.swift
//  Diary
//
//  Created by 이태영 on 2023/05/06.
//

import Foundation

protocol WeatherInfoRepository {
    func fetchWeatherInfo(
        location: Location,
        completion: @escaping (Result<WeatherInfo, NetworkError>) -> Void
    )
}
