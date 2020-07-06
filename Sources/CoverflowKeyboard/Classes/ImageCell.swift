//
//  ImageCell.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

final class ImageCell: UICollectionViewCell, CoverflowCellProtocol {
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.boldSystemFont(ofSize: 10)
        subtitle.textAlignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        return subtitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            subtitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        print("ImageCell init(coder:) not implemented")
        return nil
    }
    
    func setUp(with data: CellData) {
        imageView.image = data.image
        subtitle.text = data.subtitle
    }
    
}
