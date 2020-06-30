import UIKit

open class CoverflowKeyboard: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        inputView = UIView(frame: .zero)
        inputView?.backgroundColor = .red
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
