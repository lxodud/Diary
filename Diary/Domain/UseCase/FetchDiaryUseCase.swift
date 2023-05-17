//
//  FetchDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

protocol FetchDiaryUseCase {
    func fetchDiaryList(
        completion: @escaping (Result<[Diary], CoreDataError>) -> Void
    )
}

final class DefaultFetchDiaryUseCase {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository) {
        self.diaryRepository = diaryRepository

    }
}

extension DefaultFetchDiaryUseCase: FetchDiaryUseCase {
    func fetchDiaryList(
        completion: @escaping (Result<[Diary], CoreDataError>) -> Void
    ) {
        diaryRepository.fetchDiaryList(completion: completion)
    }
}
