//
//  Bubble&Sort&Insert.swift
//  StrikeCoding
//
//  Created by 钟亮 on 2021/2/8.
//

import UIKit

class Bubble_Sort_Insert: NSObject {
    func bubbleSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        func showResult() {
            print("冒泡---- ")
            print(result)
        }
        
        var flag = false
        for i in 0..<result.count {
            for j in 0..<result.count - i - 1 {
                if result[j] > result[j+1] {
                    result.swapAt(j, j+1)
                    flag = true
                }
            }
            if !flag {
                showResult()
                return
            }
        }
        
        showResult()
    }

    func selectSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        func showResult() {
            print("选择---- ")
            print(result)
        }
        
        for i in 0..<result.count {
            var minIdx = i
            for j in i..<result.count {
                if result[j] < result[minIdx] {
                    minIdx = j
                }
            }
            result.swapAt(minIdx, i)
        }
        
        showResult()
    }

    func insertSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        var current: Int = 0
        for i in 0..<result.count - 1 {
            current = result[i + 1]
            var preIdx = i
            // 后移
            while preIdx >= 0 && current > result[preIdx] {
                result[preIdx + 1] = result[preIdx]
                preIdx -= 1
            }
            // 插入
            result[preIdx + 1] = current
        }
        print("插入 ----")
        print(result)
    }
}

extension Bubble_Sort_Insert {
    func reviewBubbleSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        var flag = false
        for i in 0..<result.count {
            for j in 0..<result.count - i - 1 {
                if result[j] < result[j+1] {
                    result.swapAt(j, j+1)
                    flag = true
                }
            }
            if !flag {
                print(result)
                return
            }
            flag = false
        }
        print(result)
    }
    
    func reviewSelectSort(_ array:[Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        for i in 0..<result.count {
            var minIdx = i
            for j in i..<result.count {
                if result[j] < result[minIdx] {
                    minIdx = j
                }
            }
            result.swapAt(i, minIdx)
        }
        
        print(result)
    }
    
    func reviewInsertSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        for i in 0..<result.count - 1 {
            let current = result[i + 1]
            var preIndex = i
            while preIndex >= 0 && current < result[preIndex] {
                result[preIndex + 1] = result[preIndex]
                preIndex -= 1
            }
            result[preIndex + 1] = current
        }
        
        print(result)
    }
}

extension Bubble_Sort_Insert {
    func reviewInsertSort2(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        for i in 0..<result.count - 1 {
            let current = result[i + 1]
            var preIdx = i
            while preIdx >= 0 && current > result[preIdx]{
                result[preIdx + 1] = result[preIdx]
                preIdx -= 1
            }
            result[preIdx + 1] = current
        }
        print("插入 ----")
        print(result)
    }
    
    func sortReview(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        // bubble
        var bubbleResult = array
        var bubleFlag = false
        for i in 0..<bubbleResult.count {
            for j in i..<bubbleResult.count - 1 {
                if bubbleResult[j] > bubbleResult[j + 1] {
                    bubbleResult.swapAt(j, j + 1)
                    bubleFlag = true
                }
            }
            if !bubleFlag {
                return
            }
        }
        print("冒泡排序: \(bubbleResult)")
        
        // select
        var selectReulst = array
        for i in 0..<selectReulst.count {
            var minIdx = i
            for j in i..<selectReulst.count {
                if selectReulst[j] < selectReulst[minIdx] {
                    minIdx = j
                }
            }
            selectReulst.swapAt(i, minIdx)
        }
        print("选择排序: \(selectReulst)")
        
        // insert
        var insertResult = array
        
        for i in 0..<insertResult.count - 1 {
            let current = insertResult[i + 1]
            var preIdx = i
            while preIdx >= 0 && insertResult[preIdx] > current {
                insertResult[preIdx + 1] = insertResult[preIdx]
                preIdx -= 1
            }
            insertResult[preIdx + 1] = current
        }
        print("选择排序： \(insertResult)")
    }
}
