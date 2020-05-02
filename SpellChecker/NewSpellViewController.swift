//
//  NewSpellViewController.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 22/03/20.
//  Copyright © 2020 Big Nerd Ranch. All rights reserved.
//

import UIKit

class NewSpellViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    
    var item: Item? = nil
    var completionHandler: ((Bool,Item?) -> Bool)?
    
    @IBAction func closeModal(_ sender: UIButton) {
        let _ = completionHandler?(false,nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewSpell(_ sender: UIButton) {
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
        
        self.item = Item(name: spellName, description: spellDescription)
        let result = completionHandler?(true, item!)
        
        guard let saved = result else {
            return
        }
        if saved {
            print("Item created! - Name: \(spellName)")
            self.dismiss(animated: true, completion: nil)
        } else {
            showAlert(title: LocalizableStrings.duplicateSpellTitle, message: LocalizableStrings.duplicateSpellMessage)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 6
        descriptionTextView.clipsToBounds = true
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
