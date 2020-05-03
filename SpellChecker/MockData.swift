//
//  MockData.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class MockData {
    static func insertSpells(into itemStore: ItemStore) {
        // A
        itemStore.allItems.append(Item(name: "Accio", description: "Summons an object towards the caster.", image: UIImage(named: "Accio")!, date: Date()))
        itemStore.allItems.append(Item(name: "Aguamenti", description: "Produces a clean, drinkable jet of water from the wand tip.", image: UIImage(named: "Aguamenti"), date: Date()))
        itemStore.allItems.append(Item(name: "Alohomora", description: "Unlocks doors and other objects.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Anapneo", description: "Clears the target's airway if they are choking on something.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Aparecium", description: "Reveals secret messages written in invisible ink, or any other hidden markings. Also works against Concealing charms.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Arania Exumai", description: "Drives away spiders, including Acromantulas.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Aresto Momentum", description: "Decreases the velocity of a moving target.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Avifors", description: "Transforms the target into a bird.", image: nil, date: Date()))
        
        // B
        itemStore.allItems.append(Item(name: "Bombarda", description: "Provokes a small explosion.", image: nil, date: Date()))
        
        // C
        itemStore.allItems.append(Item(name: "Calvorio", description: "Removes the victim's hair.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Cantis", description: "Causes the victim to burst uncontrollably into song.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Colovaria", description: "Changes the target's colour.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Confringo", description: "Produces a fiery explosion.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Confundo", description: "Causes the victim to become confused and befuddled.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Crucio", description: "Inflicts intense pain on the recipient of the curse. This curse does not physically harm the victim, but may in extreme cases drive them insane. The pain is described as having hot knives being driven into the victim. It cannot be cast successfully by a person who is doing so out of pure spite or anger; one must feel a true desire to cause the victim pain. If one casts this spell, he or she will receive a life sentence in Azkaban prison for it, as with the other two Unforgivable Curses.", image: nil, date: Date()))
        
        // D
        itemStore.allItems.append(Item(name: "Deprimo", description: "Charm used to blast holes in the ground.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Depulso", description: "Sends the target away from the caster. It is the counter-charm to the Summoning Charm.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Descendo", description: "Causes object to fall or move downwards.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Diffindo", description: "Used to precisely cut or tear objects.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Duro", description: "Turns an object to stone.", image: nil, date: Date()))
        
        // E
        itemStore.allItems.append(Item(name: "Engorgio", description: "Causes the target to swell in physical size. Its counter-charm is the Shrinking Charm.", image: nil, date: Date()))
        itemStore.allItems.append(Item(name: "Episkey", description: "Used to heal relatively minor injuries, such as broken bones and cartilage.", image: nil, date: Date()))
    }
}
