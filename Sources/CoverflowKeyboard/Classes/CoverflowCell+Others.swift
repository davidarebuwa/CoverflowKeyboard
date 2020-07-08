//
//  CoverflowCellProtocol.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

public struct CellData {
    let cellType: CellType
    let title: String?
    let image: UIImage?
    let subtitle: String?
}

internal protocol CoverflowCellProtocol {
    func setUp(with data: CellData)
}

public enum CellType: String {
    case imageCell = "imageCell"
    case emojiCell = "emojiCell"
    case customCell = "customCell"
}

public protocol CoverflowDelegate {
    func didSelect(cellAt indexPath: IndexPath)
}

extension UIButton {
    public func add(keyboard: CoverflowKeyboard) {
        let hidden = UITextField(frame: .zero)
        hidden.inputView = inputView
        hidden.snapshotView(afterScreenUpdates: true)
        addSubview(hidden)
        addTarget(self, action: #selector(presentKeyboard), for: .touchUpInside)
    }
    
    @objc
    func presentKeyboard() {
        subviews.first { ($0 as? UITextField != nil) }?.becomeFirstResponder()
    }
}

extension UITextField {
    public func add(keyboard: CoverflowKeyboard) {
        inputView = keyboard.inputView
        inputView?.snapshotView(afterScreenUpdates: true)
    }
}

extension UITableViewCell {
    public func present(keyboard: CoverflowKeyboard) {
        let hidden = UITextField(frame: .zero)
        hidden.inputView = keyboard.inputView
        hidden.snapshotView(afterScreenUpdates: true)
        addSubview(hidden)
        hidden.becomeFirstResponder()
    }
}
