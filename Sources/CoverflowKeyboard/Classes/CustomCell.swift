//
//  ImageCell.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

final class CustomCell: UICollectionViewCell, CoverflowCellProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUp(with data: CellData) {
        // maybe add a aubview thats supplied via CellData
        // to make it super configurable
    }
    
}
