//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 朱亚静 on 2018/9/30.
//  Copyright © 2018 朱亚静. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = ZPositionButton.init(frame: CGRect(x: 200, y: 200, width: 200, height: 200), space: 5, labelHeight: 30)
        
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        
        button.backgroundColor = UIColor.yellow
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.text = "好的button"
        button.setTitle("好的button", for: .normal)
        self.view.addSubview(button)
        button.titleLabel?.backgroundColor = UIColor.red

        let emptyString = "123"
        let ins = String(describing: emptyString)
        print("ins :\(ins)")
        enum directionAll:CaseIterable {
            case east,west,north,south
        }
        print(directionAll.allCases)
       
    }
    func filterMethod(num:Int) -> Bool {
        return num % 2 == 0
    }
}

