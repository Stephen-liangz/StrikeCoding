//
//  Merge_Quick.swift
//  StrikeCoding
//
//  Created by 钟亮 on 2021/2/9.
//

import UIKit

/// 归并排序和快速排序，利用分治的处理思想，使用递归技巧完成代码变成。
/// 分治是一种处理思想，递归是一种编程技巧。
/// 写递归的技巧: 1.分析出递推公式；2.找到终止条件。
class Merge_Quick: NSObject {

}

extension Merge_Quick {
    
    /// 归并
    /// - Parameter array: 排序数组
    func mergeSort(_ array: [Int]) {
        guard array.count >= 2 else {
            print(array)
            return
        }
        let result = mergeSort_c(array: array)
        print("归并排序：\(result)")
        
        reviewMergeSort(array)
    }
    
    
    /// 归并排序递归调用方法
    /// - Parameters:
    ///   - array: 排序数组
    private func mergeSort_c(array: [Int]) -> [Int]{
        guard array.count >= 2 else {
            return array
        }
        let midIdx = (array.count) / 2
        
        let leftArray = Array.init(array[0..<midIdx])
        let rightArray = Array.init(array[midIdx..<array.count])
        
        let pArray = mergeSort_c(array: leftArray)
        let rArray = mergeSort_c(array: rightArray)
        
        let result = merge( pArray: pArray, qArray: rArray)
        return result
    }
    
    private func merge( pArray: [Int], qArray: [Int]) -> [Int] {
        var i = 0
        var j = 0
        let count = pArray.count + qArray.count
        var result = Array.init(repeating: 0, count: count)
        for index in 0..<count {
            if i >= pArray.count {
                result[index] = qArray[j]
                j += 1
            }else if j >= qArray.count {
                result[index] = pArray[i]
                i += 1
            }else if pArray[i] < qArray[j] {
                result[index] = pArray[i]
                i += 1
            }else{
                result[index] = qArray[j]
                j += 1
            }
        }
        
        return result
    }
    
}

private extension Merge_Quick {
    func reviewMergeSort(_ array: [Int]) {
        guard array.count > 2 else {
            return
        }
        print("归并排序：\(mergeSort_Recursion(array))")
    }
    
    func mergeSort_Recursion(_ array: [Int]) -> [Int] {
        guard array.count >= 2 else {
            return array
        }
        
        let midIdx = array.count / 2
        
        let leftA = Array(array[0..<midIdx])
        let rightA = Array(array[midIdx..<(array.count)])
        
        let sortedLeftArray = mergeSort_Recursion(leftA)
        let sortedRightArray = mergeSort_Recursion(rightA)
        
        return reviewMerge(leftArray: sortedLeftArray, rightArray: sortedRightArray)
    }
    
    func reviewMerge(leftArray: [Int], rightArray: [Int]) -> [Int]{
        let count = (leftArray.count + rightArray.count)
        var result = Array.init(repeating: 0, count: count)
        var i = 0
        var j = 0
        
        for idx in 0..<count {
            if i >= leftArray.count {
                result[idx] = rightArray[j]
                j += 1
            }else if j >= rightArray.count {
                result[idx] = leftArray[i]
                i += 1
            }else if leftArray[i] < rightArray[j] {
                result[idx] = leftArray[i]
                i += 1
            }else {
                result[idx] = rightArray[j]
                j += 1
            }
        }
        
        return result
    }
}

extension Merge_Quick {
    /// 快速排序
    /// - Parameter array: 需要排序的数组
    func quickSort<T: RandomAccessCollection & MutableCollection>(_ array: inout T) where T.Element: Comparable{
        guard array.count > 1 else {
            return
        }
        quickSort_c(&array, array.startIndex, array.index(before: array.endIndex))
        print("快速排序：\(array)")
    }
    
    /// 快速排序递归方法
    /// - Parameters:
    ///   - array: 数组
    ///   - p: 数组开始下标
    ///   - r: 数组末尾下标
    private func quickSort_c<T: RandomAccessCollection & MutableCollection>(_ array: inout T, _ low: T.Index, _ high: T.Index) where T.Element: Comparable {
        guard low < high else {
            return
        }
        let m = partition(&array, low, high)
        quickSort_c(&array, low, array.index(before: m))
        quickSort_c(&array, array.index(after: m), high)
    }
    
    
    private func partition<T:RandomAccessCollection & MutableCollection>(_ array: inout T, _ low: T.Index, _ high: T.Index) -> T.Index where T.Element: Comparable {
        let pivot = array[low]
        var j = low
        var i = array.index(after: low)
        while i <= high {
            if array[i] <= pivot {
                array.formIndex(after: &j)
                array.swapAt(i, j)
            }
            array.formIndex(after: &i)
        }
        array.swapAt(low, j)
        return j
    }
}
