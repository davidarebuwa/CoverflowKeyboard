//
//  ImageCell.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

class ImageCell: UICollectionViewCell {
    var imageView: UIImageView
    var image: UIImage
    var subtitle: UILabel
    var imageName: String = ""
    
    override init(frame: CGRect) {
        image = UIImage()
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.roundedCorners()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        subtitle = UILabel()
        subtitle.font = UIFont.boldSystemFont(ofSize: 10)
        subtitle.textAlignment = .center
        if #available(iOS 13.0, *) {
            subtitle.textColor = .secondaryLabel
        } else {
            subtitle.textColor = .lightGray
        }
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 4
        contentView.addSubview(imageView)
        contentView.addSubview(subtitle)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        subtitle.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
}

extension UIImageView {
    func roundedCorners() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.1
        layer.masksToBounds = true
    }
}
