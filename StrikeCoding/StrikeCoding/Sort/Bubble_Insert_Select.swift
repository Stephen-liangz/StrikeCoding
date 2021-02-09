//
//  Bubble&Sort&Insert.swift
//  StrikeCoding
//
//  Created by 钟亮 on 2021/2/8.
//

import UIKit

/// 有序度是数据中具有有序关系的对数。
/// 一个完全有序的数据，叫做满有序度。
/// 一个 N 个数据的数组，满有序度为 n*(n-1)/2。
/// 同样的还有逆序度，逆序度 = 满有序度 - 有序度。
class Bubble_Insert_Select: NSObject {
    
    /// 冒泡排序
    /// 1.从头到尾，依次循环比较相连两个数，然后换位,称为一次冒泡操作；
    /// 2.每次冒泡，能让一个数据完成排序，n 次冒泡就能将所有数据完成排序。
    ///
    /// best： O(n)
    /// worst:  O(n2)
    /// 空间复杂度 O(1)
    /// 稳定排序
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

    
    /// 插入排序
    /// 1.将数据分成已排序区间和未排序区间；
    /// 2.每次循环找到未排序区间最小的数据；
    /// 3.然后将这次循环找到的最小数插入到已排序区间的最后
    /// Best: O(n)
    /// Worst: O(n2)
    /// 空间复杂度：O(1)
    /// 稳定排序
    /// - Parameter array: <#array description#>
    func insertSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        var result = array
        
        func showResult() {
            print("插入---- ")
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

    
    /// 选择排序，
    /// 1.将数据分成已排序区和未排序区；
    /// 2.每次从为未排序区取出一个数 current ，在已排序区中倒序取出数据，同未排序区中取出的数据进行比较；
    /// 3.如果已排序的数据符合比较条件，则把已排序的数据向后移动一位；
    /// 4.直到找到 current 的排序位置，将 current 插如已排序区。
    ///
    /// Best: O(n2)
    /// Worst: O(n2)
    /// 空间复杂度：O(1）
    /// 不稳定排序
    func selectSort(_ array: [Int]) {
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

extension Bubble_Insert_Select {
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
    
    func reviewInsertSort(_ array:[Int]) {
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
    
    func reviewSelectSort(_ array: [Int]) {
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

extension Bubble_Insert_Select {
    func reviewSelectSort2(_ array: [Int]) {
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
        
        // insert
        var insertResult = array
        for i in 0..<insertResult.count {
            var minIdx = i
            for j in i..<insertResult.count {
                if insertResult[j] < insertResult[minIdx] {
                    minIdx = j
                }
            }
            insertResult.swapAt(i, minIdx)
        }
        print("插入排序: \(insertResult)")
        
        // select
        var selectResult = array
        
        for i in 0..<selectResult.count - 1 {
            let current = selectResult[i + 1]
            var preIdx = i
            while preIdx >= 0 && selectResult[preIdx] > current {
                selectResult[preIdx + 1] = selectResult[preIdx]
                preIdx -= 1
            }
            selectResult[preIdx + 1] = current
        }
        print("选择排序: \(selectResult)")
    }
}

extension Bubble_Insert_Select {
    func reviewSort(_ array: [Int]) {
        guard array.count > 1 else {
            return
        }
        
        // Insert sort
        var insertArray = Array.init(array)
        for i in 0..<insertArray.count - 1 {
            let current = insertArray[i + 1]
            var preIdx = i
            while preIdx >= 0 && insertArray[preIdx] > current {
                insertArray[preIdx + 1] = insertArray[preIdx]
                preIdx -= 1
            }
            insertArray[preIdx + 1] = current
        }
        
        print("插入排序: \(insertArray)")
        
        // Select sort
        var selectResult = Array.init(array)
        for i in 0..<selectResult.count {
            var minIdx = i
            for j in i..<selectResult.count {
                if selectResult[j] < selectResult[minIdx] {
                    minIdx = j
                }
            }
            selectResult.swapAt(minIdx, i)
        }
        print("选择排序：\(selectResult)")
        
        // Bubble sort
        var bubbleResult = Array.init(array)
        for i in 0..<bubbleResult.count {
            var bubbleFlag = false
            for j in 0..<bubbleResult.count - i - 1 {
                if bubbleResult[j] > bubbleResult[j + 1] {
                    bubbleResult.swapAt(j, j + 1)
                    bubbleFlag = true
                }
            }
            if !bubbleFlag {
                print("提前完成排序的 冒泡排序：\(bubbleResult)")
                return
            }
        }
        print("冒泡排序：\(bubbleResult)")
    }
}
