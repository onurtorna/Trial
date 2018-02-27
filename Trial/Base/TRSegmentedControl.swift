//
//  TRSegmentedControl.swift
//  Trial
//
//  Created by Onur Torna on 27/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import UIKit

class TRSegmentedControl: UISegmentedControl, Localizeable {

    var stringTable: StringTable = .commons

    var localizationKeys: [String]?
}

extension TRSegmentedControl {

    /// Text to be localized. In this case segmented control titles.
    /// Give titles in order as a string array
    var localizeableTexts: [String]? {
        get {
            var localizeableTexts: [String] = []
            for index in 0..<numberOfSegments {
                if let title = titleForSegment(at: index) {
                    localizeableTexts.append(title)
                }
            }

            return localizeableTexts
        }

        set {
            guard let localizeableTexts = newValue else { return }

            for index in 0..<localizeableTexts.count {
                setTitle(localizeableTexts[index], forSegmentAt: index)
            }
        }
    }
}
