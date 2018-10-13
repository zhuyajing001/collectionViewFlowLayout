//
//  ScaleFlowLayout.swift
//  SwiftDemo
//
//  Created by 朱亚静 on 2018/10/10.
//  Copyright © 2018 朱亚静. All rights reserved.
//

import UIKit

class ScaleFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        self.scrollDirection = .horizontal;
        // 修改内边距（让第一个和最后一个cell能居中）
        let inset = ((self.collectionView?.frame.width)! - self.itemSize.width) * 0.5
        self.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
    }

    private var centerX:CGFloat {
        return (collectionView?.bounds.width)!/2.0 + (collectionView?.contentOffset.x)!
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layouts = super.layoutAttributesForElements(in: rect)
        let arr = copy(layouts)
        scale(arr)
        return arr
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let lastRect = CGRect(x: proposedContentOffset.x, y: proposedContentOffset.y, width: (collectionView?.frame.width)!, height: (collectionView?.frame.height)!)
        //这个范围内所有的属性
        let arr = self.layoutAttributesForElements(in: lastRect)
        //需要移动的距离
        var adjustDistance = CGFloat(MAXFLOAT)
        for attributes in arr! {
            if abs(attributes.center.x - centerX) < abs(adjustDistance) {
                adjustDistance = attributes.center.x - centerX
            }
        }
        return CGPoint(x:proposedContentOffset.x + adjustDistance , y: proposedContentOffset.y)
    }
    
    
    private func copy(_ layoutAttributesArray: [UICollectionViewLayoutAttributes]?) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributesArray?.map{ $0.copy() } as? [UICollectionViewLayoutAttributes]
    }
    // 放大效果
    private func scale(_ layoutAttributesArray: [UICollectionViewLayoutAttributes]?) {
        for attributes in layoutAttributesArray! {
            let distance = abs(attributes.center.x - centerX)
            // 移动的距离和屏幕宽度的的比例
            let apartScale = distance/(collectionView?.frame.width)!
            //把卡片移动范围固定到 -π/4到 +π/4这一个范围内
            let scale = abs(cos(apartScale / 4 * CGFloat.pi))
            //设置cell的缩放 按照余弦函数曲线 越居中越趋近于1
            attributes.transform = CGAffineTransform(scaleX: 1.0, y: scale)
        }
    }
}
