//
//  CoverFlowImageCell.swift
//  CoverflowKeyboard
//
//  Created by Us on 01/07/2020.
//

import UIKit

class CoverFlowImageCell: UICollectionViewCell {
    var imageView: UIImageView
    var image: UIImage
    var subtitle: UILabel
 
    var imageName: String = ""
    
    override init(frame: CGRect) {
        image = UIImage()
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        //imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: 200)
        imageView.roundedCorners()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        subtitle = UILabel()
        subtitle.font = UIFont.boldSystemFont(ofSize: 10)
        subtitle.textAlignment = .center
        subtitle.textColor = .secondaryLabel
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
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIImageView {
    func roundedCorners() {
        layer.cornerRadius = 10
        layer.borderWidth = 0.1
        layer.masksToBounds = true
    }
}
