//
//  CoverflowLayout.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//

import UIKit

class CoverflowLayout: UICollectionViewFlowLayout {
    let activeDistance: CGFloat = 200
    let zoomFactor: CGFloat = 0.7

    override init() {
        super.init()

        scrollDirection = .horizontal
        minimumLineSpacing = 65
        itemSize = CGSize(width: 150, height: 150)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepare() {
        guard let collectionView = collectionView else { fatalError("collectionview not initialized") }
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - itemSize.height) / 2
        let horizonatalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: verticalInsets, left: horizonatalInsets, bottom: verticalInsets, right: horizonatalInsets)

        super.prepare()
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        let rectAttributes = super.layoutAttributesForElements(in: rect)!.compactMap { $0.copy() as? UICollectionViewLayoutAttributes }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.frame.size)

        for attributes in rectAttributes where attributes.frame.intersects(visibleRect) {
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = distance / activeDistance

            if distance.magnitude < activeDistance {
                let zoom = 1 +  zoomFactor * (1 - normalizedDistance.magnitude)
                attributes.transform3D = CATransform3DMakeScale(zoom, zoom, 1)
                attributes.zIndex = Int(zoom.rounded())
            }
        }
        return rectAttributes
    }
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity) }

                var offsetAdjustment = CGFloat.greatestFiniteMagnitude
                let horizontalOffset = proposedContentOffset.x + collectionView.contentInset.left

                let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)

                let layoutAttributesArray = super.layoutAttributesForElements(in: targetRect)

                layoutAttributesArray?.forEach({ (layoutAttributes) in
                    let itemOffset = layoutAttributes.frame.origin.x
                    if fabsf(Float(itemOffset - horizontalOffset)) < fabsf(Float(offsetAdjustment)) {
                        offsetAdjustment = itemOffset - horizontalOffset
                    }
                })

                return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
            }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool { true }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        if let context = super.invalidationContext(forBoundsChange: newBounds) as? UICollectionViewFlowLayoutInvalidationContext {
            context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
            return context
        } else { fatalError("context invalid") }
    }
}
