//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class Item: Equatable {
    var name: String
    var description: String
    var image: UIImage?

    init(name: String, description: String, image: UIImage? = nil) {
        self.name = name
        self.description = description
        self.image = image
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }
}
