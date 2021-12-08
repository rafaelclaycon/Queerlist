//
//  Copyright © 2020 Rafael Claycon Schmitt
//

import UIKit

class PersonalityDetailViewController: UIViewController {

    @IBOutlet var favoriteButton: UIBarButtonItem!
    
    @IBOutlet var name: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var famouseQuote: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spellDescription: UITextView!

    var item: Personality! {
        didSet {
            navigationItem.title = item.name
            if item.isFavorite {
                setFavoriteIconIsFavorite()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        name.text = item.name
        type.text = IdentityType.getTypeNameForTinyHeader(item.type)
        if let quote = item.famousQuote {
            famouseQuote.text = "\"\(quote)\""
        } else {
            famouseQuote.text = ""
        }
        spellDescription.text = item.description
        
        name.accessibilityIdentifier = "spell_title"
        spellDescription.accessibilityIdentifier = "spell_description"
        
        // If there's an image for the spell, assign it.
        if item.image != nil {
            imageView.image = item.image
        }
        
        // If there's no image for the spell, hide the UIImageView.
        if item.image == nil {
            imageView.isHidden = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Clear first responder
        view.endEditing(true)
    }

    @IBAction func backgroundTapped(_: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func markFavorite(_: UIButton) {
        if item.isFavorite {
            showAlert(title: "Remove Favorite?", message: "")
            setFavoriteIconNotFavorite()
        } else {
            item.isFavorite = true
            setFavoriteIconIsFavorite()
            DispatchQueue.main.async {
                ToastOverlay.shared.show()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                ToastOverlay.shared.hide()
            })
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func setFavoriteIconNotFavorite() {
        favoriteButton.image = UIImage(systemName: "star")
    }
    
    private func setFavoriteIconIsFavorite() {
        favoriteButton.image = UIImage(systemName: "star.fill")
    }

}
