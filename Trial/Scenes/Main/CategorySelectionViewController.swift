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

    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var containerView: UIView!
    private var containerSubview: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        changeSubviewOfContainerView()
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        changeSubviewOfContainerView(selectedSegmentIndex: sender.selectedSegmentIndex)
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


