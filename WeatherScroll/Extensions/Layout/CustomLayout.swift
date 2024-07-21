//
//  CustomLayout.swift
//  WeatherScroll
//
//  Created by Andrei Kovryzhenko on 22.07.2024.
//

import UIKit

//MARK: - CollectionHorizontalFlowLayout
class Layout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        scrollDirection = .horizontal
        sectionInsetReference = .fromLayoutMargins
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        let horizontalOffset = proposedContentOffset.x
        let targetRect = CGRect.init(origin: .init(x: proposedContentOffset.x, y: 0), size: collectionView.bounds.size)
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        for layoutAttributes in super.layoutAttributesForElements(in: targetRect)! {
            let itemOffset = layoutAttributes.frame.origin.x
            
            if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        return CGPoint.init(x: proposedContentOffset.x + offsetAdjustment - collectionView.layoutMargins.left, y: proposedContentOffset.y)
    }
}
