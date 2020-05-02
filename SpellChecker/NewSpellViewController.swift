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
    var completionHandler: ((Item) -> Item)?
    
    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addNewSpell(_ sender: UIButton) {
        item?.name = nameTextField.text!
        item?.description = descriptionTextView.text
        let result = completionHandler?(item!)
        print("Item created! - Name: \(result?.name ?? "")")
        self.dismiss(animated: true, completion: nil)
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
}
