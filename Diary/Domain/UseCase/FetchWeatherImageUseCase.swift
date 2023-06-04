//
//  FetchWeatherImageUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/22.
//

import Foundation

protocol FetchWeahterImageUseCase {
    func fetchWeatherImage(
        icon: String,
        completion: @escaping (Result<Data, Error>) -> Void
    )
}

final class DefaultFetchWeatherImageUseCase {
    private let weatherImageRepository: WeatherImageRepository
    
    init(weatherImageRepository: WeatherImageRepository = DefaultWeatherImageRepository()) {
        self.weatherImageRepository = weatherImageRepository
    }
}

extension DefaultFetchWeatherImageUseCase: FetchWeahterImageUseCase {
    func fetchWeatherImage(
        icon: String,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        weatherImageRepository.fetchWeahterImage(icon: icon, completion: completion)
    }
}
