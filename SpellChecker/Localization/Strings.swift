//
//  Strings.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 02/05/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import Foundation

struct LocalizableStrings {
    static let nameFieldIsEmptyTitle = NSLocalizedString("NameFieldIsEmptyTitle", comment: "The title of the alert that tells the user the name field is empty on the New Spell screen.")
    static let nameFieldIsEmptyMessage = NSLocalizedString("NameFieldIsEmptyMessage", comment: "The message of the alert that tells the user the name field is empty on the New Spell screen.")
    static let descriptionFieldIsEmptyTitle = NSLocalizedString("DescriptionFieldIsEmptyTitle", comment: "The title of the alert that tells the user the description field is empty on the New Spell screen.")
    static let descriptionFieldIsEmptyMessage = NSLocalizedString("DescriptionFieldIsEmptyMessage", comment: "The message of the alert that tells the user the description field is empty on the New Spell screen.")
    static let ok = NSLocalizedString("OK", comment: "Confirmation action for alerts.")
    static let duplicateSpellTitle = NSLocalizedString("DuplicatedSpellTitle", comment: "The title of the alert that tells the user the spell already exists when they try to add it from the New Spell screen.")
    static let duplicateSpellMessage = NSLocalizedString("DuplicatedSpellMessage", comment: "The message of the alert that tells the user the spell already exists when they try to add it from the New Spell screen.")
}
