//
//  NewSpellViewController.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 22/03/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class NewSpellViewController: UIViewController {
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addButton: UIButton!

    var item: Spell?
    var completionHandler: ((Bool, Spell?) -> Bool)?

    @IBAction func closeModal(_: UIButton) {
        _ = completionHandler?(false, nil)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addNewSpell(_: UIButton) {
        guard let spellName = nameTextField.text else {
            return
        }
        guard let spellDescription = descriptionTextView.text else {
            return
        }
        guard spellName != "" else {
            showAlert(title: LocalizableStrings.nameFieldIsEmptyTitle, message: LocalizableStrings.nameFieldIsEmptyMessage)
            return
        }
        guard spellDescription != "" else {
            showAlert(title: LocalizableStrings.descriptionFieldIsEmptyTitle, message: LocalizableStrings.descriptionFieldIsEmptyMessage)
            return
        }

        item = Spell(name: spellName, type: .charm, description: spellDescription)
        let result = completionHandler?(true, item!)

        guard let saved = result else {
            return
        }
        if saved {
            print("Item created! - Name: \(spellName)")
            dismiss(animated: true, completion: nil)
        } else {
            showAlert(title: LocalizableStrings.duplicateSpellTitle, message: LocalizableStrings.duplicateSpellMessage)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.borderColor = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.00).cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 6
        descriptionTextView.clipsToBounds = true
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        present(alert, animated: true, completion: nil)
    }
}
