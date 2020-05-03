//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class Item: Equatable {
    var name: String
    var description: String
    var image: UIImage?
    var isFavorite: Bool
    var dateAdded: Date

    init(name: String, description: String, image: UIImage? = nil, date: Date) {
        self.name = name
        self.description = description
        self.image = image
        isFavorite = false
        dateAdded = date
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }
}
