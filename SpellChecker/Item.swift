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
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var index = Int.random(in: 0..<adjectives.count)
            let randomAdjective = adjectives[index]
            
            index = Int.random(in: 0..<nouns.count)
            let randomNoun = nouns[index]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            //let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName,
                description: randomSerialNumber)
        }
        else {
            self.init(name: "", description: "")
        }
    }

    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.description == rhs.description
    }

}
