//
//  LocalizationManager.swift
//  Trial
//
//  Created by Onur Torna on 21/02/18.
//  Copyright (c) 2003-2018 Onur Torna Corp. All rights reserved.
//
//  Save to the extent permitted by law, you may not use, copy, modify,
//  distribute or create derivative works of this material or any part
//  of it without the prior written consent of Onur Torna.
//  Any reproduction of this material must contain this notice.
//

import Foundation

final class LocalizationManager {

    private enum Const {
        static let languageFileExtension = "lproj"
    }

    enum Language: String {
        case Turkish = "tr"
        case English = "en"

        var localeIdentifier: String {
            switch self {
            case .Turkish:
                return LocaleIdentifier.Turkish.rawValue
            default:
                return LocaleIdentifier.English.rawValue
            }
        }
    }

    private enum LocaleIdentifier: String {
        case Turkish = "tr_TR"
        case English = "en_EN"
    }

    /// Singleton shared instance
    static let shared = LocalizationManager(with: .Turkish)

    /// Current language of the localization manager instance
    var currentLanguage: Language {
        didSet {
            LocalizationManager.shared.bundle = LocalizationManager.updateBundle(with: currentLanguage)
            // TODO: Post notification
        }
    }

    /// Bundle of the localization manager instance
    var bundle: Bundle

    /// Locale of the localization manager instance
    var locale: Locale

    init(with language: Language) {
        currentLanguage = language
        bundle = LocalizationManager.updateBundle(with: language)
        locale = Locale(identifier: language.localeIdentifier)
    }

    // MARK: - Helpers

    @discardableResult private static func updateBundle(with language: Language) -> Bundle {

        let path = Bundle(for: LocalizationManager.self).path(forResource: language.rawValue,
                                                              ofType: Const.languageFileExtension) ?? ""
        return Bundle(path: path) ?? Bundle.main
    }
}
