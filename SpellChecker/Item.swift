//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class Item: Equatable {
    var name: String
    var description: String
    var image: UIImage?
    var isFavorite: Bool

    init(name: String, description: String, image: UIImage? = nil, favorite: Bool = false) {
        self.name = name
        self.description = description
        self.image = image
        self.isFavorite = favorite
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }
}
