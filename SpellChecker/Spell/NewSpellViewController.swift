//
//  NewSpellViewController.swift
//  SpellChecker
//
//  Created by Rafael Schmitt on 22/03/20.
//  Copyright © 2020 Rafael Claycon Schmitt. All rights reserved.
//

import UIKit

class NewSpellViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var typeTextField: UITextField!

    var item: Spell?
    var completionHandler: ((Bool, Spell?) -> Bool)?
    var pickerData = [SpellType.transfiguration.rawValue,
                      SpellType.charm.rawValue,
                      SpellType.jinx.rawValue,
                      SpellType.hex.rawValue,
                      SpellType.curse.rawValue,
                      SpellType.counterSpell.rawValue,
                      SpellType.healingSpell.rawValue]

    @IBAction func closeModal(_: UIButton) {
        _ = completionHandler?(false, nil)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapDoneOnSpellTypePicker() {
        print("Did tap Done.")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextField.text = pickerData[row]
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
        
        self.setUpSpellTypeField()
        
        self.view.accessibilityIdentifier = UITestID.newSpellScreen
        self.nameTextField.accessibilityIdentifier = UITestID.spellNameField
    }
    
    private func setUpSpellTypeField() {
        let picker: UIPickerView
        picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        picker.backgroundColor = .systemBackground

        //picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemBlue
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.donePicker))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        typeTextField.inputView = picker
        typeTextField.inputAccessoryView = toolBar
        typeTextField.tintColor = .clear
        
        typeTextField.text = pickerData[0]
    }
    
    @objc private func donePicker(_: UIButton) {
        self.view.endEditing(true)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        present(alert, animated: true, completion: nil)
    }
}
