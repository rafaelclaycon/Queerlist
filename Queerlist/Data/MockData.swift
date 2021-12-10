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
        
        let river = Personality(name: "River Gallo",
                                type: .intersex,
                                famousQuote: nil,
                                description: "River Gallo is a Salvadoran-American filmmaker, actor, model, and intersex rights activist. They wrote, directed, and acted in the 2019 short film Ponyboi, which is the first film to feature an openly intersex actor playing an intersex person.",
                                image: UIImage(named: "river"),
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
        
        let timCook = Personality(name: "Tim Cook",
                                  type: .gay,
                                  famousQuote: nil,
                                  description: "Timothy Donald Cook is an American business executive who has been the chief executive officer of Apple Inc. since 2011. Cook previously served as the company's chief operating officer under its co-founder Steve Jobs. In 2014, Cook became the first chief executive of a Fortune 500 company to publicly come out as gay. Cook also serves on the boards of directors of Nike, Inc. and the National Football Foundation, and is a trustee of Duke University. Outside of Apple, Cook engages in philanthropy, and in March 2015, he said he planned to donate his fortune to charity.",
                                  image: UIImage(named: "tim_cook"),
                                  date: Date())
        
        let timGunn = Personality(name: "Tim Gunn",
                                  type: .asexual,
                                  famousQuote: nil,
                                  description: "Timothy MacKenzie Gunn is an American author, actor, and television personality. He served on the faculty of Parsons School of Design from 1982 to 2007 and was chair of fashion design at the school from August 2000 to March 2007, after which he joined Liz Claiborne (now Kate Spade & Company) as its chief creative officer. Over 16 seasons Gunn has become well known as the on-air mentor to designers on the reality television program Project Runway.",
                                  image: UIImage(named: "tim_gunn"),
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
        store.allItems.append(river)
        store.allItems.append(rupaul)
        store.allItems.append(thammy)
        store.allItems.append(timCook)
        store.allItems.append(timGunn)
    }

}
