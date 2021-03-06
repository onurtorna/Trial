//
//  String+Additions.swift
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

extension String {

    /// Makes string uppercased according to current selected locale
    func toUppercase() -> String {
        return self.uppercased(with: LocalizationManager.shared.locale)
    }
}
