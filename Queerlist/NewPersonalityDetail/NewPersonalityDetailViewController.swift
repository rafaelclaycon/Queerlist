import UIKit

internal class NewPersonalityDetailViewController: UIViewController {
    
    private lazy var baseView: NewPersonalityDetailView = {
        let view = NewPersonalityDetailView()
        return view
    }()
    
//    internal init(presenter: OrderRefundIncidentOpeningPresenterProtocol) {
//        self.presenter = presenter
//        super.init()
//        hidesBottomBarWhenPushed = true
//    }
    
    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // presenter.moduleLoaded()
    }
    
}

extension NewPersonalityDetailViewController: CodableView {
    
    internal func buildViews() {
        view.addSubview(baseView)
    }
    
    internal func configConstraints() {
        baseView.snp.makeConstraints { constraint in
            constraint.edges.equalToSuperview()
        }
    }
    
}
