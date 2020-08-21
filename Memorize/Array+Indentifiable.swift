//
//  Array+Indentifiable.swift
//  Memorize
//
//  Created by Wang Shaobo on 2020/8/20.
//  Copyright © 2020 Wang Shaobo. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
