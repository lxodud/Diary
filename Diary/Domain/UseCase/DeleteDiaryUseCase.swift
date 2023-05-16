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
        completion: @escaping(Result<Void, CoreDataError>) -> Void
    )
}
