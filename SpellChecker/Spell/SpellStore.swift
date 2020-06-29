//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import Foundation

class SpellStore {
    var allItems = [[Spell]]()

    static func getSubArrayIndex(for firstLetter: Substring) -> Int? {
        switch firstLetter {
        case "A":
            return 0
        case "B":
            return 1
        case "C":
            return 2
        case "D":
            return 3
        case "E":
            return 4
        case "F":
            return 5
        case "G":
            return 6
        case "H":
            return 7
        case "I":
            return 8
        case "J":
            return 9
        case "K":
            return 10
        default:
            return nil
        }
    }
    
    static func getLetter(for subArrayIndex: Int) -> String {
        switch subArrayIndex {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        case 3:
            return "D"
        case 4:
            return "E"
        case 5:
            return "F"
        case 6:
            return "G"
        case 7:
            return "H"
        case 8:
            return "I"
        case 9:
            return "J"
        case 10:
            return "K"
        default:
            return " "
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int, item: Spell) {
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
    }

    func insertItem(_ item: Spell) {
        let firstLetter = item.name.prefix(1)
        guard let index = SpellStore.getSubArrayIndex(for: firstLetter) else {
            fatalError("getSubArrayIndex() is not prepared for the first letter of \(item.name).")
        }
        allItems[index].append(item)
    }

    func spellAlreadyExists(_ spellName: String) -> Bool {
        for subArray in allItems {
            for spell in subArray {
                if spell.name == spellName {
                    return true
                }
            }
        }
        return false
    }
}
