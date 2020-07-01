//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import Foundation

class SpellStore {
    var spells = [String: [Spell]]()
    
    var letters = [String]()
    
    /*func moveItem(from fromIndex: Int, to toIndex: Int, item: Spell) {
        if fromIndex == toIndex {
            return
        }
        
        let firstLetter = item.name.prefix(1)
        guard let subArrayIndex = SpellStore.getSubArrayIndex(for: firstLetter) else {
            fatalError("getSubArrayIndex() is not prepared for the first letter of \(item.name).")
        }

        // Get reference to object being moved so you can re-insert it
        let movedItem = allItems[subArrayIndex][fromIndex]

        // Remove item from array
        allItems[subArrayIndex].remove(at: fromIndex)

        // Insert item in array at new location
        allItems[subArrayIndex].insert(movedItem, at: toIndex)
    }

    func removeItem(_ item: Spell) {
        let firstLetter = item.name.prefix(1)
        guard let subArrayIndex = SpellStore.getSubArrayIndex(for: firstLetter) else {
            fatalError("getSubArrayIndex() is not prepared for the first letter of \(item.name).")
        }
        if let index = allItems[subArrayIndex].index(of: item) {
            allItems.remove(at: index)
        }
    }*/

    func insertItem(_ item: Spell) {
        let firstLetter = String(item.name.prefix(1))
        
        if spells[firstLetter] == nil {
            spells[firstLetter] = [Spell]()
        }
        spells[firstLetter]!.append(item)
        
        letters.append(firstLetter)
        letters = letters.sorted()
    }

    func spellAlreadyExists(_ spellName: String) -> Bool {
        let firstLetter = String(spellName.prefix(1))
        
        guard let subListOfSpells = spells[firstLetter] else {
            return false
        }
                
        for spell in subListOfSpells {
            if spell.name == spellName {
                return true
            }
        }
        return false
    }
}
