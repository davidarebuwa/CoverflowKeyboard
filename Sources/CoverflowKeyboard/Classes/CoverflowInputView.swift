//
//  CoverflowKeyboard.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

@available(iOS 11.0, *)
internal final class CoverFlowInputView: UIView {
    var feedbackGenerator: UISelectionFeedbackGenerator? = UISelectionFeedbackGenerator()
    var collectionView: UICollectionView
    var parent: CoverflowKeyboard
    
    init(_ frame: CGRect, _ parent: CoverflowKeyboard) {
        self.parent = parent
        self.collectionView = UICollectionView(frame: frame,collectionViewLayout: CoverflowLayout())
        super.init(frame: frame)

        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: CellType.imageCell.rawValue)
        collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: CellType.emojiCell.rawValue)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CellType.customCell.rawValue)
        
        collectionView.delegate = self
        collectionView.dataSource = self
       //collectionView.collectionViewLayout = CoverflowLayout()
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])

        snapshotView(afterScreenUpdates: true)
        feedbackGenerator?.prepare()
    }

    required init?(coder: NSCoder) { nil }

}

@available(iOS 11.0, *)
extension CoverFlowInputView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CoverflowCellProtocol else {
            fatalError("invalid cell dequeued")
        }
        
        cell.setUp(with: parent.data[indexPath.row])
        feedbackGenerator?.selectionChanged()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parent.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: parent.data[indexPath.row].cellType.rawValue, for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        parent.delegate?.didSelect(with: parent, cellAt: indexPath)
    }

}
