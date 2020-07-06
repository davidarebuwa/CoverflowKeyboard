//
//  CoverflowCellProtocol.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

struct CellData {
    let cellType: CellType
    let title: String?
    let image: UIImage?
    let subtitle: String?
}

protocol CoverflowCellProtocol {
    func setUp(with data: CellData)
}

enum CellType: String {
    case imageCell = "imageCell"
    case emojiCell = "emojiCell"
    case customCell = "customCell"
}
