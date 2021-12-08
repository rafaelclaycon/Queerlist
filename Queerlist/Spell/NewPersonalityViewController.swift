import UIKit

class NewPersonalityViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var typeButton: UIButton!

    var item: Personality?
    var completionHandler: ((Bool, Personality?) -> Bool)?
    var pickerData = [IdentityType.lesbian.rawValue,
                      IdentityType.gay.rawValue,
                      IdentityType.bisexual.rawValue,
                      IdentityType.transgender.rawValue,
                      IdentityType.queer.rawValue,
                      IdentityType.intersex.rawValue,
                      IdentityType.asexual.rawValue,
                      IdentityType.transvestite.rawValue]

    @IBAction func closeModal(_: UIButton) {
        _ = completionHandler?(false, nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickSpellType(_: UIButton) {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)

        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        picker.backgroundColor = UIColor.systemBackground
        //picker.layer.borderColor = UIColor.systemFill.cgColor
        //picker.layer.borderWidth = 1
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.didTapDoneOnSpellTypePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.didTapDoneOnSpellTypePicker))

        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        //typeButton.inputView = picker
        //typeButton.inputAccessoryView = toolBar
        view.addSubview(toolBar)
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
        typeButton.setTitle(pickerData[row], for: .normal)
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

        item = Personality(name: spellName, type: .lesbian, description: spellDescription)
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
        
        typeButton.setTitle(pickerData[0], for: .normal)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        present(alert, animated: true, completion: nil)
    }

}
