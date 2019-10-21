//
//  Common.swift
//  3DTouchQuickAction
//
//  Created by youngjun goo on 2019/10/21.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import Foundation


enum ShortcutIdentifier: String {
    case First
    case Second
    case Third
    
    init?(fullType: String) {
        guard let last = fullType.components(separatedBy: ".").last else {
            return nil
        }
        self.init(rawValue: last)
    }
    
    var type: String {
        return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
    }
}
