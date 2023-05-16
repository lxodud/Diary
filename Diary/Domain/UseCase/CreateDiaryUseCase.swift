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
