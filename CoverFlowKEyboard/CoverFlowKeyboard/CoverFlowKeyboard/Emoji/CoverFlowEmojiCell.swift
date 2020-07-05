//
//  CoverFlowCell.swift
//  CoverflowKeyboard
//
//  Created by Us on 05/07/2020.
//

import UIKit
class CoverFlowEmojiCell: UICollectionViewCell {
    var emoji: UILabel
    var subtitle: UILabel
    var container: UIStackView
    
    override init(frame: CGRect) {
        emoji = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 2))
        emoji.textAlignment = .center
        emoji.font = UIFont.boldSystemFont(ofSize: 30)
        
        subtitle = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 24))
        subtitle.font = UIFont.systemFont(ofSize: 10)
        subtitle.textAlignment = .center
        subtitle.textColor = .secondaryLabel
        container = UIStackView(arrangedSubviews: [emoji, subtitle])
        container.axis = .vertical
        container.alignment = .center
        container.spacing = 10
        container.distribution = .equalSpacing
        container.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        

        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = contentView.layer.frame.width / 2
        
        contentView.addSubview(container)
        container.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
