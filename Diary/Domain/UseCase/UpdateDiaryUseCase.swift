//
//  UpdateDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

protocol UpdateDiaryUseCase {
    func updateDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
}

final class DefaultUpdateDiaryUseCase {
    
}
