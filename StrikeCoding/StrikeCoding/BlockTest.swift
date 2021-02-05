//
//  BlockTest.swift
//  StrikeCoding
//
//  Created by 钟亮 on 2021/2/5.
//

import UIKit

class BlockTest: NSObject {
    typealias testBlock = ((Int)->())
    
    static func showTest() {
        let block1: testBlock = { idx in
            print(idx)
        }
        let block2: testBlock = { idx in
            print(idx)
        }
        let tests = [block1, block2]
        
        for (idx, block) in tests.enumerated() {
            block(idx)
        }
        
        let testDic: [String: testBlock]! = ["1" : block1]
        testDic["1"]?(1)
    }
}
