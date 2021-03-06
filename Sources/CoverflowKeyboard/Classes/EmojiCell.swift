//
//  ImageCell.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

final class EmojiCell: UICollectionViewCell, CoverflowCellProtocol {
    var emoji: UILabel = {
        let emoji = UILabel()
        emoji.font = UIFont.boldSystemFont(ofSize: 10)
        emoji.textAlignment = .center
        emoji.translatesAutoresizingMaskIntoConstraints = false
        return emoji
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
        contentView.addSubview(emoji)
        contentView.addSubview(subtitle)
        
        NSLayoutConstraint.activate([
            emoji.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            emoji.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            emoji.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            emoji.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: 10),
            
            subtitle.topAnchor.constraint(equalTo: emoji.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setUp(with data: CellData) {
        emoji.text = data.title
        subtitle.text = data.subtitle
    }

}
