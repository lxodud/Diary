//
//  UpdateDiaryUseCase.swift
//  Diary
//
//  Created by 이태영 on 2023/05/16.
//

protocol UpdateDiaryUseCase {
    func updateDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    )
}

final class DefaultUpdateDiaryUseCase {
    private let diaryRepository: DiaryRepository
    
    init(diaryRepository: DiaryRepository) {
        self.diaryRepository = diaryRepository
    }
}

extension DefaultUpdateDiaryUseCase: UpdateDiaryUseCase {
    func updateDiary(
        with diary: Diary?,
        completion: @escaping(Result<Void, Error>) -> Void
    ) {
        diaryRepository.updateDiary(with: diary, completion: completion)
    }
}
