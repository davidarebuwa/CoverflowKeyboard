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
    
    required init?(coder: NSCoder) {
        print("ImageCell init(coder:) not implemented")
        return nil
    }
    
    func setUp(with data: CellData) {
        
    }
    
}
