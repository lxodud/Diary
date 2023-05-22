//
//  FetchWeatherInfoUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/22.
//

protocol FetchWeatherInfoUseCase {
    func fetchWeatherInfo(completion: @escaping (Result<WeatherInfo, Error>) -> Void)
}

final class DefaultFetchWeatherInfoUseCase {
    private let weatherInfoRepository: WeatherInfoRepository
    private let locationRepository: LocationRepository
    
    init(
        weatherInfoRepository: WeatherInfoRepository,
        locationRepository: LocationRepository
    ) {
        self.weatherInfoRepository = weatherInfoRepository
        self.locationRepository = locationRepository
    }
}

extension DefaultFetchWeatherInfoUseCase: FetchWeatherInfoUseCase {
    func fetchWeatherInfo(completion: @escaping (Result<WeatherInfo, Error>) -> Void) {
        let currentLocation = locationRepository.fetchCurrentLocation()
        
        weatherInfoRepository.fetchWeatherInfo(location: currentLocation, completion: completion)
    }
}
