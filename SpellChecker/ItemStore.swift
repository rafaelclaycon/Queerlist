//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import Foundation

class ItemStore {
    var allItems: [Item] = []

    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }

        // Get reference to object being moved so you can re-insert it
        let movedItem = allItems[fromIndex]

        // Remove item from array
        allItems.remove(at: fromIndex)

        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }

    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)

        allItems.append(newItem)

        return newItem
    }

    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }

    func insertItem(_ item: Item) {
        allItems.append(item)
    }

    func spellAlreadyExists(_ spellName: String) -> Bool {
        for spell in allItems {
            if spell.name == spellName {
                return true
            }
        }
        return false
    }
}
