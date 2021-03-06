//
//  BaseViewController.swift
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

class BaseViewController: UIViewController, LocalizationChangeListening {

    override func viewDidLoad() {
        super.viewDidLoad()
        activateLocalization()
    }

    var localizeableViews: [Localizeable] {
        // Override in child classes
        return []
    }

    func setStringTableForLocalizeableViews() {
        // Implement in child classes
    }

    func setLocalizationKeysForLocalizeableViews() {
        // Implement in child classes
    }
}
