//
//  StringTable.swift
//  Trial
//
//  Created by Onur Torna on 22/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import Foundation

enum StringTable: String {

    case commons = "Commons"

    /// Returns localized key with the current selected app language
    ///
    /// - Parameter key: Localization key
    /// - Returns: Localized value
    func localized(key: String?) -> String {
        guard let key = key else {
            return ""
        }
        return NSLocalizedString(key,
                                 tableName: rawValue,
                                 bundle: LocalizationManager.shared.bundle,
                                 value: key, comment: "")
    }

    /// Localizes and formats given String with arguments
    ///
    /// - Parameters:
    ///   - formatKey: String to be formatted
    ///   - arguments: Arguments to apply
    /// - Returns: Formatted localized string
    func localized(format formatKey: String, arguments: String...) -> String {
        let format = localized(key: formatKey)
        return String(format: format, arguments)
    }
}

