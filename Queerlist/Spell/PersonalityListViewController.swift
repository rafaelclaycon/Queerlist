import UIKit

class PersonalityListViewController: UITableViewController {

    var personalityStore: PersonalityStore!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
        tableView.accessibilityIdentifier = UITestID.personalityList
    }
    
    @IBAction func sortPersonalities(_: UIBarButtonItem) {
        let alert = UIAlertController(title: LocalizableStrings.sortByPopupTitle, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: LocalizableStrings.aToZSortOption, style: .default, handler: { _ in
            NSLog("The \"A to Z\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.favoritesAtTheTopSortOption, style: .default, handler: { _ in
            NSLog("The \"Favorites At the Top\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.dateAddedSortOption, style: .default, handler: { _ in
            NSLog("The \"Date Added\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.customSortOption, style: .default, handler: { _ in
            NSLog("The \"Custom\" option was picked.")
        }))
        alert.addAction(UIAlertAction(title: LocalizableStrings.cancel, style: .cancel, handler: { _ in
            NSLog("The \"Cancel\" option was picked.")
        }))
        present(alert, animated: true, completion: nil)
    }

    @IBAction func addNewItem(_: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "NewPersonalityViewController") as! NewPersonalityViewController
        secondVC.modalPresentationStyle = .formSheet
        secondVC.completionHandler = { add, item in
            guard add else {
                return false
            }
            guard let newItem = item else {
                return false
            }
            guard !self.personalityStore.personalityAlreadyExists(newItem.name) else {
                return false
            }

            self.personalityStore.insertItem(newItem)
            if let index = self.personalityStore.allItems.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
            }
            return true
        }
        present(secondVC, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = personalityStore.allItems[row]
                let detailViewController = segue.destination as! PersonalityDetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

    override func tableView(_: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // Update the model
        personalityStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }

    override func tableView(_: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command...
        if editingStyle == .delete {
            let item = personalityStore.allItems[indexPath.row]

            // Remove the item from the store
            personalityStore.removeItem(item)

            // Also remove that row from the table view with an animation
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return personalityStore.allItems.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create an instance of UITableViewCell, with default appearance
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpellCell",
                                                 for: indexPath) as! PersonalityCell

        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview
        let item = personalityStore.allItems[indexPath.row]

        if item.isFavorite {
            let imageAttachment = NSTextAttachment()
            let star = UIImage(systemName: "star.fill")
            let orangeStar = star?.withTintColor(UIColor.orange, renderingMode: .alwaysOriginal)
            imageAttachment.image = orangeStar

            let fullString = NSMutableAttributedString(string: item.name + " ")
            fullString.append(NSAttributedString(attachment: imageAttachment))
            cell.nameLabel.attributedText = fullString
        } else {
            cell.nameLabel.text = item.name
        }

        return cell
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 64
    }

}
