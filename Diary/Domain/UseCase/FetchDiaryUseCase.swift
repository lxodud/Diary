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
