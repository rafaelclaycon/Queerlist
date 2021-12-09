import UIKit
import SnapKit

internal class NewPersonalityDetailView: UIView {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        return label
    }()
    
    private lazy var identityTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Gay"
        return label
    }()
    
    private lazy var famouseQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "To be or not to be, that is the question."
        return label
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "natalie")
        return imageView
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Lorem ipsum"
        return textView
    }()

}

// MARK: - Codable View
extension NewPersonalityDetailView: CodableView {

    internal func buildViews() {
        addSubviews(nameLabel, identityTypeLabel, famouseQuoteLabel, photoImageView, descriptionTextView)
    }
    
    internal func configViews() {
        backgroundColor = .white
    }
    
    internal func configConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
    }

}
