//
//  Array+Only.swift
//  Memorize
//
//  Created by Wang Shaobo on 2020/8/22.
//  Copyright © 2020 Wang Shaobo. All rights reserved.
//

import Foundation

extension Array {
    func only() -> Element? {
        self.count == 1 ? self.first : nil
    }
}
