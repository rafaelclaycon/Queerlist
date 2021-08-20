//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import Foundation

class PersonalityStore {
    var allItems: [Personality] = []

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

    func removeItem(_ item: Personality) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }

    func insertItem(_ item: Personality) {
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
