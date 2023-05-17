//
//  CreateDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

protocol CreateDiaryUseCase {
    func createDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
}

final class DefaultCreateDiaryUseCase {
    private let diaryRepository: DiaryRepository
    private let weatherInfoRepository: WeatherInfoRepository
    private let locationRepository: LocationRepository
    
    init(
        diaryRepository: DiaryRepository,
        weatherInfoRepository: WeatherInfoRepository,
        locationRepository: LocationRepository
    ) {
        self.diaryRepository = diaryRepository
        self.weatherInfoRepository = weatherInfoRepository
        self.locationRepository = locationRepository
    }
}

extension DefaultCreateDiaryUseCase: CreateDiaryUseCase {
    func createDiary(
        with diary: Diary?,
        completion: @escaping (Result<Void, CoreDataError>) -> Void
    ) {
        let currentLocation = locationRepository.fetchCurrentLocation()
        weatherInfoRepository.fetchWeatherInfo(location: currentLocation) { result in
            switch result {
            case .success(let weahterInfo):
                var savedDiary = diary
                savedDiary?.condition = weahterInfo
                self.diaryRepository.createDiary(
                    with: savedDiary,
                    completion: completion
                )
            case .failure(let error):
                completion(.failure(.fetchError))
            }
        }
        
    }
}
