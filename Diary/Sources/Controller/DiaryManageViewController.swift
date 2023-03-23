//
//  DiaryManageViewController.swift
//  Diary
//
//  Created by 이태영 on 2023/03/23.
//

import UIKit

class DiaryManageViewController: UIViewController {
    private let titleTextField = UITextField(
        font: UIFont.boldTitle1,
        placeholder: LocalizedConstant.TextField.titlePlaceholder
    )
    
    private let contentTextView = UITextView(
        font: .preferredFont(forTextStyle: .body),
        lineFragmentPadding: .zero,
        textContainerInset: .zero
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: UI Configuration
extension DiaryManageViewController {
    private func addElementViews() {
        [
            titleTextField,
            contentTextView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
    }
    
    private func setTitleTextFieldAnchor() {
        let safeArea = view.safeAreaLayoutGuide
        
        titleTextField.anchor(
            top: safeArea.topAnchor,
            leading: safeArea.leadingAnchor,
            trailing: safeArea.trailingAnchor,
            paddingTop: 8,
            paddingLeading: 16,
            paddingTrailing: 16
        )
    }
    
    private func setContentTextViewAnchor() {
        let safeArea = view.safeAreaLayoutGuide
        
        contentTextView.anchor(
            top: titleTextField.bottomAnchor,
            leading: view.readableContentGuide.leadingAnchor,
            bottom: safeArea.bottomAnchor,
            trailing: view.readableContentGuide.trailingAnchor,
            paddingTop: 8
        )
    }
}
