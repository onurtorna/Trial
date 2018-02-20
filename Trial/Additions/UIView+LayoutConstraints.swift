//
//  UIView+LayoutConstraints.swift
//  Trial
//
//  Created by Onur Torna on 19/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import UIKit

extension UIView {

    func embed(childView: UIView?, constant: CGFloat) {

        guard let childView = childView else { return }

        addTrailingConstraint(to: childView, constant: constant)
        addLeadingConstraint(to: childView, constant: constant)
        addBottomConstraint(to: childView, constant: constant)
        addTopConstraint(to: childView, constant: constant)
    }

    func addTrailingConstraint(to childView: UIView?, constant: CGFloat) {

        guard let childView = childView else { return }

        let trailingConstraint = NSLayoutConstraint(item: childView,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: constant)

        self.addConstraint(trailingConstraint)
    }

    func addLeadingConstraint(to childView: UIView?, constant: CGFloat) {

        guard let childView = childView else { return }

        let leadingConstraint = NSLayoutConstraint(item: childView,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: constant)

        self.addConstraint(leadingConstraint)
    }

    func addTopConstraint(to childView: UIView?, constant: CGFloat) {

        guard let childView = childView else { return }

        let topConstraint = NSLayoutConstraint(item: childView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: self,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: constant)

        self.addConstraint(topConstraint)
    }

    func addBottomConstraint(to childView: UIView?, constant: CGFloat) {

        guard let childView = childView else { return }

        let bottomConstraint = NSLayoutConstraint(item: childView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: constant)

        self.addConstraint(bottomConstraint)
    }

}
