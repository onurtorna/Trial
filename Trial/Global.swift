//
//  Global.swift
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

import Foundation

enum Global {

    enum NotificationIdentifier: String {
        case localizationChange = "LocalizationChangeNotification"

        var name: Notification.Name {
            return Notification.Name(rawValue: rawValue)
        }
    }

}
