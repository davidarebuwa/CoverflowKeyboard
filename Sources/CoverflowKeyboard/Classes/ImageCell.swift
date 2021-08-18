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
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.boldSystemFont(ofSize: 10)
        subtitle.textAlignment = .center
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.backgroundColor = .clear
        return subtitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(subtitle)
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = false
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .tertiarySystemGroupedBackground
        }

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 80),
            contentView.widthAnchor.constraint(equalToConstant: 80),

            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            subtitle.heightAnchor.constraint(equalToConstant: 20),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
        ])
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUp(with data: CellData) {
        imageView.image = data.image
        subtitle.text = data.subtitle
    }
    
}
