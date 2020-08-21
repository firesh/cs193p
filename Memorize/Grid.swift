//
//  Grid.swift
//  Memorize
//
//  Created by Wang Shaobo on 2020/8/20.
//  Copyright © 2020 Wang Shaobo. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader() { geometry in
            ForEach(self.items) { item in
                self.body(for: item, in: GridLayout(itemCount: self.items.count, in: geometry.size))
            }
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.items.firstIndex(matching: item)!
        return self.viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
