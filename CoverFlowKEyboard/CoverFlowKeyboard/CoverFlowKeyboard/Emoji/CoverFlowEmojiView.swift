//
//  CoverFlowView.swift
//  CoverflowKeyboard
//
//  Created by Us on 30/06/2020.
//

import UIKit

class CoverFlowEmojiView: UIView, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    var collectionView: UICollectionView
    var feedbackGenerator: UISelectionFeedbackGenerator?
    
    let data = [("🇿🇦","South Africa"),("🇩🇪","Germany"),("🇮🇹","Italy"),("🇬🇷","Greece"),("🇬🇾","Guyana"),("🇬🇪","Georgia"),("🇧🇬","Bulgaria"),("🇧🇷","Brazil"),("🇧🇩","Bangladesh"),("🇨🇦","Canada"),("🇧🇸","Bahamas")]
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: ZoomAndSnapFlowLayout())
        super.init(frame: frame)
        
        feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator?.prepare()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(CoverFlowEmojiCell.self, forCellWithReuseIdentifier: "Cell")
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    deinit {
        feedbackGenerator = nil
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let emojiCell = cell as? CoverFlowEmojiCell
        emojiCell?.emoji.text = data[indexPath.row].0
        emojiCell?.subtitle.text = data[indexPath.row].1
        feedbackGenerator?.selectionChanged()
        feedbackGenerator?.prepare()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85 * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.snapshotView(afterScreenUpdates: true)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CoverFlowEmojiCell
        print("Selected: \(cell?.emoji.text ?? "-")")
    }
    
}
