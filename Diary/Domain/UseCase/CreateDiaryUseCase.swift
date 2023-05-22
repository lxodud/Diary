//
//  CreateDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

protocol CreateDiaryUseCase {
    func createDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    )
}

final class DefaultCreateDiaryUseCase {
    private let diaryRepository: DiaryRepository
    private let fetchWeatherInfoUseCase: FetchWeatherInfoUseCase

    
    init(
        diaryRepository: DiaryRepository,
        fetchWeatherInfoUseCase: FetchWeatherInfoUseCase
    ) {
        self.diaryRepository = diaryRepository
        self.fetchWeatherInfoUseCase = fetchWeatherInfoUseCase
    }
}

extension DefaultCreateDiaryUseCase: CreateDiaryUseCase {
    func createDiary(
        with diary: Diary?,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        
        
        fetchWeatherInfoUseCase.fetchWeatherInfo { result in
            switch result {
            case .success(let weahterInfo):
                var savedDiary = diary
                savedDiary?.condition = weahterInfo
                self.diaryRepository.createDiary(
                    with: savedDiary,
                    completion: completion
                )
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
