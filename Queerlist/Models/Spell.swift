//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class Spell: Equatable {
    var name: String
    var nickname: String?
    var type: SpellType
    var pronunciation: String?
    var description: String
    var image: UIImage?
    var isFavorite: Bool
    var dateAdded: Date

    init(name: String, nickname: String?, type: SpellType, pronunciation: String?, description: String, image: UIImage? = nil, date: Date) {
        self.name = name
        self.nickname = nickname
        self.type = type
        self.pronunciation = pronunciation
        self.description = description
        self.image = image
        isFavorite = false
        dateAdded = date
    }
    
    convenience init(name: String, type: SpellType, description: String) {
        self.init(name: name, nickname: nil, type: type, pronunciation: nil, description: description, date: Date())
    }

    static func == (lhs: Spell, rhs: Spell) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }
}
