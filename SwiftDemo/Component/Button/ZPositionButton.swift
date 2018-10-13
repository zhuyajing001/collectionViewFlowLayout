//
//  ZPositionButton.swift
//  U17
//
//  Created by 朱亚静 on 2018/9/30.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

class ZPositionButton: UIButton {

    var titleRect:CGRect?
    var imageRect:CGRect?
    
    // 初始化
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.titleRect
    }
    //构造方法默认是不会被继承，基类的存储属性只能通过基类的构造方法来初始化
    //派生类引入的存储属性要先被初始化，然后再调用父类的构造方法对父类的属性进行初始化
    //只能通过调用父类的指定构造方法来对父类的属性进行初始化，不能通过便利构造方法
    init(frame: CGRect,titleRect:CGRect,imageRect:CGRect) {

        super.init(frame: frame)
        self.titleRect = titleRect
        self.imageRect = imageRect
//        UIButton.init(type: .custom)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init() {
       self.init()
    }
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        if (titleRect?.isNull)! || (titleRect?.isEmpty)! {
            return super.titleRect(forContentRect: contentRect)
        }
        return titleRect!
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if (imageRect?.isNull)! || (imageRect?.isEmpty)! {
            return super.imageRect(forContentRect: contentRect)
        }
        return imageRect!
    }
}

extension ZPositionButton {
    convenience init(frame:CGRect,space:CGFloat,labelHeight:CGFloat) {
        let imageWidth = frame.height - space - labelHeight
        let titleRect = CGRect(x: 0, y: frame.height - labelHeight, width: frame.width, height: labelHeight)
        let imageRect = CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth)
        self.init(frame: frame, titleRect: titleRect, imageRect: imageRect)
        self.titleLabel?.textAlignment = .center
    }

}
