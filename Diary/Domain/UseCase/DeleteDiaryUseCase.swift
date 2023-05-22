//
//  DeleteDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

import Foundation

protocol DeleteDiaryUseCase {
    func deleteDiary(
        with id: UUID,
        completion: @escaping(Result<Void, Error>) -> Void
    )
}

final class DefaultDeleteDiaryUseCase {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository) {
        self.diaryRepository = diaryRepository
    }
}

extension DefaultDeleteDiaryUseCase: DeleteDiaryUseCase {
    func deleteDiary(
        with id: UUID,
        completion: @escaping(Result<Void, Error>) -> Void
    ) {
        diaryRepository.deleteDiary(with: id, completion: completion)
    }
}
