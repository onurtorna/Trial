//
//  AboutUsViewController.swift
//  Trial
//
//  Created by Onur Torna on 16/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import UIKit

class AboutUsViewController: BaseViewController {

    override var localizeableViews: [Localizeable] {
        return [first]
    }

    @IBOutlet weak var first: TRLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.brown
    }

    // MARK: - LocalizationChangeListening
    override func setStringTableForLocalizeableViews() {
        first.stringTable = StringTable.commons
    }

    override func setLocalizationKeysForLocalizeableViews() {
        first.localizationKeys = ["aboutUs"]
    }
}
