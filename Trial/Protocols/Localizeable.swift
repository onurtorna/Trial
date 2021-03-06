//
//  Localizeable.swift
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

/// Indicates an object can be localizeable
protocol Localizeable {

    /// Texts to be localized
    var localizeableTexts: [String]? { get set }

    /// Localization keys of the object
    var localizationKeys: [String]? { get set }

    /// Related string table of the text
    var stringTable: StringTable { get set }
}
