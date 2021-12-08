import UIKit

class Personality: Equatable {

    var name: String
    var type: IdentityType
    var famousQuote: String?
    var description: String
    var image: UIImage?
    var isFavorite: Bool
    var dateAdded: Date

    init(name: String, type: IdentityType, famousQuote: String?, description: String, image: UIImage? = nil, date: Date) {
        self.name = name
        self.type = type
        self.famousQuote = famousQuote
        self.description = description
        self.image = image
        isFavorite = false
        dateAdded = date
    }
    
    convenience init(name: String, type: IdentityType, description: String) {
        self.init(name: name, type: type, famousQuote: nil, description: description, date: Date())
    }

    static func == (lhs: Personality, rhs: Personality) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }

}
