import UIKit

class MockData {
    
    static let placeholder = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

    static func insertData(into store: PersonalityStore) {
        let alan = Personality(name: "Alan Turing",
                               type: .gay,
                               famousQuote: nil,
                               description: "Alan Turing, born June 23, 1912 in London, England, was a British mathematician and logician who made major contributions to mathematics, cryptanalysis, logic, philosophy, and mathematical biology and also to the new areas later named computer science, cognitive science, artificial intelligence, and artificial life. In March 1952 he was convicted of “gross indecency”—that is to say, homosexuality, a crime in Britain at that time—and he was sentenced to 12 months of hormone “therapy.” Now with a criminal record, he would never again be able to work for Government Communications Headquarters (GCHQ), the British government’s postwar code-breaking centre. Alan was discovered dead in his bed, poisoned by cyanide. The official verdict was suicide, but no motive was established at the 1954 inquest.",
                               image: UIImage(named: "alan")!,
                               date: Date())
        
        let cassia = Personality(name: "Cássia Eller",
                                 type: .lesbian,
                                 famousQuote: "I walk around, wanting to meet you on every corner I stop at every look, I leave the sadness and I bring hope in its place.",
                                 description: placeholder,
                                 image: UIImage(named: "cassia"),
                                 date: Date())
            
        let laerte = Personality(name: "Laerte",
                                 type: .transgender,
                                 famousQuote: "People must be able to live the identity that seems most appropriate to them.",
                                 description: placeholder,
                                 image: UIImage(named: "laerte"),
                                 date: Date())
            
        let ludmilla = Personality(name: "Ludmilla",
                                   type: .bisexual,
                                   famousQuote: nil,
                                   description: placeholder,
                                   image: UIImage(named: "ludmilla"),
                                   date: Date())
            
        let marsha = Personality(name: "Marsha P. Johnson",
                                 type: .transvestite,
                                 famousQuote: nil,
                                 description: placeholder,
                                 image: UIImage(named: "marsha"),
                                 date: Date())
            
        let marta = Personality(name: "Marta",
                                type: .lesbian,
                                famousQuote: nil,
                                description: placeholder,
                                image: UIImage(named: "marta"),
                                date: Date())
            
        let missBia = Personality(name: "Miss Biá",
                                  type: .gay,
                                  famousQuote: nil,
                                  description: placeholder,
                                  image: UIImage(named: "missBia"),
                                  date: Date())
            
        let natalie = Personality(name: "Natalie Wynn",
                                  type: .transgender,
                                  famousQuote: "Trans liberation now!",
                                  description: placeholder,
                                  image: UIImage(named: "natalie"),
                                  date: Date())
        
        let pabllo = Personality(name: "Pabllo Vittar",
                                 type: .gay,
                                 famousQuote: nil,
                                 description: placeholder,
                                 image: UIImage(named: "pabllo"),
                                 date: Date())
        
        let paulo = Personality(name: "Paulo Iotti",
                                type: .gay,
                                famousQuote: nil,
                                description: placeholder,
                                image: UIImage(named: "paulo"),
                                date: Date())
            
        let rupaul = Personality(name: "RuPaul",
                                 type: .gay,
                                 famousQuote: nil,
                                 description: placeholder,
                                 image: UIImage(named: "rupaul"),
                                 date: Date())
            
        let thammy = Personality(name: "Thammy Miranda",
                                 type: .transgender,
                                 famousQuote: nil,
                                 description: placeholder,
                                 image: UIImage(named: "thammy"),
                                 date: Date())
        
        store.allItems.append(alan)
        store.allItems.append(cassia)
        store.allItems.append(laerte)
        store.allItems.append(ludmilla)
        store.allItems.append(marsha)
        store.allItems.append(marta)
        store.allItems.append(missBia)
        store.allItems.append(natalie)
        store.allItems.append(pabllo)
        store.allItems.append(paulo)
        store.allItems.append(rupaul)
        store.allItems.append(thammy)
    }

}
