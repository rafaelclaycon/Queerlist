//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import Foundation

class Item: Equatable {
    var name: String
    var description: String

    init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }
}
