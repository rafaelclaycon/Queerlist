import UIKit

protocol CodableView {

    func configViews()
    func buildViews()
    func configConstraints()

}

extension CodableView {

    func setupViews() {
        configViews()
        buildViews()
        configConstraints()
    }

    func configViews() {}

}

/// Self-managing CodableView
class UICodableView: UIView, CodableView {

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViews() {
        fatalError("configConstraints has not been implemented")
    }

    func configConstraints() {
        fatalError("configConstraints has not been implemented")
    }

    func configViews() { }

}

extension UIStackView {

    public func addArrangedSubviews(_ views: UIView...) {
        addArrangedSubviews(views)
    }

    public func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }

}

extension UIView {

    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    func applyNavBarConstraints(size: (width: CGFloat, height: CGFloat)) {
        let widthConstraint = widthAnchor.constraint(equalToConstant: size.width)
        let heightConstraint = heightAnchor.constraint(equalToConstant: size.height)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
    }

}
