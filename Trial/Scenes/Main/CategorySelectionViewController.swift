//
//  CategorySelectionViewController.swift
//  Trial
//
//  Created by Onur Torna on 15/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import UIKit

class CategorySelectionViewController: BaseViewController {

    private enum Const {
        static let languageButtonCornerRadius: CGFloat = 3.0
        static let languageButtonBorderWidth: CGFloat = 1.0
    }

    override var localizeableViews: [Localizeable] {
        return  [segmentedControl]
    }

    @IBOutlet private weak var segmentedControl: TRSegmentedControl!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var languageButton: UIButton!
    private var containerSubview: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        changeSubviewOfContainerView()

        languageButton.layer.borderWidth = Const.languageButtonBorderWidth
        languageButton.layer.cornerRadius = Const.languageButtonCornerRadius
        languageButton.layer.borderColor = UIColor.black.cgColor
    }

    // MARK: - LocalizationChangeListening
    override func setStringTableForLocalizeableViews() {
        segmentedControl.stringTable = .commons
    }

    override func setLocalizationKeysForLocalizeableViews() {
        segmentedControl.localizationKeys = ["aboutUs", "contactUs"]
    }
}

// MARK: - Actions
private extension CategorySelectionViewController {

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSubviewOfContainerView(selectedSegmentIndex: sender.selectedSegmentIndex)
    }

    @IBAction func languageButtonTapped(_ sender: Any) {
        LocalizationManager.shared.switchLanguage()
        languageButton.setTitle(StringTable.commons.localized(key: "language"), for: .normal)
    }
}

// MARK: - Helpers
private extension CategorySelectionViewController {

    /// Removes current subview of the container and Adds view with the given segment selection index
    ///
    /// - Parameter selectedSegmentIndex: Selected index of segment control
    func changeSubviewOfContainerView(selectedSegmentIndex: Int = 0) {
        if let viewControllerType = SelectableViewControllerController(rawValue: selectedSegmentIndex) {
            containerSubview = CategorySelectionViewControllerGenerator.generate(viewController: viewControllerType).view
            if let subview = containerView.subviews.first {
                subview.removeFromSuperview()
            }
            containerView.addSubview(containerSubview)
            containerSubview.translatesAutoresizingMaskIntoConstraints = false
            containerView.embed(childView: containerSubview, constant: 0.0)
        }
    }
}
