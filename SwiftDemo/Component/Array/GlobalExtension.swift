//
//  ArrayCollectionExtension.swift
//  SwiftDemo
//
//  Created by 朱亚静 on 2018/10/9.
//  Copyright © 2018 朱亚静. All rights reserved.
//

import Foundation
import UIKit
/// 集合操作扩展
/// 屏幕属性
let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height


var isIphoneXSeries:Bool {
    guard #available(iOS 11.0, *) else {
        return false
    }
    if UIDevice.current.userInterfaceIdiom != .phone {
        return false
    }
    let keyWin = (UIApplication.shared.delegate?.window)!;
    if keyWin!.safeAreaInsets.bottom > 0.0 {
        return true
    }
    return true
}

extension UIColor {
    convenience init(r:UInt32, g:UInt32, b:UInt32, a:CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: a)
    }
    class var random: UIColor {
        return UIColor(r: arc4random_uniform(256), g: arc4random_uniform(256), b: arc4random_uniform(256))
    }
    
}

//MARK: swizzledMethod
extension NSObject {
    
    static func swizzleMethod(_ cls: AnyClass, originalSelector: Selector, swizzleSelector: Selector){
        
        let originalMethod = class_getInstanceMethod(cls, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(cls, swizzleSelector)!
        let didAddMethod = class_addMethod(cls,
                                           originalSelector,
                                           method_getImplementation(swizzledMethod),
                                           method_getTypeEncoding(swizzledMethod))
        if didAddMethod {
            class_replaceMethod(cls,
                                swizzleSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
