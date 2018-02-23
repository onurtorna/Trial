//
//  LocalizationChangeListening.swift
//  Trial
//
//  Created by Onur Torna on 23/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import UIKit

protocol LocalizationChangeListening: class {

    var localizeableViews: [Localizeable] { get }

    /// Register for localizations notification
    func registerForLocalizationNotification()

    /// Updates required localizations
    func updateLocalization()

    /// Sets string table values for localizeable vies
    func setStringTableForLocalizeableViews()

    /// Sets localization keys for localizeable vies
    func setLocalizationKeysForLocalizeableViews()

    /// Activates the localization by setting values and registering for the notification
    func activateLocalization()
}

extension LocalizationChangeListening {

    func registerForLocalizationNotification() {
        NotificationCenter.default.addObserver(forName: Global.NotificationIdentifier.localizationChange.name,
                                               object: nil,
                                               queue: OperationQueue.main) { (_) in
                                                // To avoid @objc decleration in protocol
                                                self.updateLocalization()
        }
    }

    func updateLocalization() {
        for var view in localizeableViews {
            view.localizeableText = view.stringTable.localized(key: view.localizationKey)
        }
    }

    func activateLocalization() {
        registerForLocalizationNotification()
        setStringTableForLocalizeableViews()
        setLocalizationKeysForLocalizeableViews()
        updateLocalization()
    }
}
