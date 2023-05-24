//
//  DiaryListViewModel.swift
//  Diary
//
//  Created by 이태영 on 2023/05/22.
//

import Foundation

enum DiaryListAction {
    case fetchDiaries
    case deleteDiary
    case didSelectItem
    case didSelectRightBarButton
}

protocol DiaryListViewModelInput {
    func action(_ action: DiaryListAction)
}

protocol DiaryListViewModelOutput {
    var diaries: Observable<[Diary]> { get set }
    var navigationTitle: String { get}
}

final class DiaryListViewModel: DiaryListViewModelOutput {
    // MARK: Output
    var diaries: Observable<[Diary]> = Observable(value: [])
    let navigationTitle = NSLocalizedString("AppTitle", comment: "앱 타이틀")
    
    // MARK: UseCase
    private let fetchDiaryUseCase: FetchDiaryUseCase
    private let deleteDiaryUseCase: DeleteDiaryUseCase
    
    init(
        fetchDiaryUseCase: FetchDiaryUseCase = DefaultFetchDiaryUseCase(),
         deleteDiaryUseCase: DeleteDiaryUseCase = DefaultDeleteDiaryUseCase()
    ) {
        self.fetchDiaryUseCase = fetchDiaryUseCase
        self.deleteDiaryUseCase = deleteDiaryUseCase
    }
}

// MARK: Input
extension DiaryListViewModel: DiaryListViewModelInput {
    func action(_ action: DiaryListAction) {
        switch action {
        case .fetchDiaries:
            fetchDiary()
        case .deleteDiary:
            break
        case .didSelectItem:
            break
        case .didSelectRightBarButton:
            break
        }
    }
}

extension DiaryListViewModel {
    private func fetchDiary() {
        fetchDiaryUseCase.fetchDiaryList { result in
            switch result {
            case .success(let diaries):
                self.diaries.value = diaries
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    private func deleteDiary() {
        
    }
}
