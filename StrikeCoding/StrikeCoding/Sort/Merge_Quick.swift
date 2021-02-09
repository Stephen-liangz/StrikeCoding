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
    }
    
    
    /// 归并排序递归调用方法
    /// - Parameters:
    ///   - array: 排序数组
    ///   - p: 下标
    ///   - q: 下标
    private func mergeSort_c(array: [Int]) -> [Int]{
        guard array.count >= 2 else {
            return array
        }
        let midIdx = (array.count) / 2
        
        let leftArray = Array.init(array[0..<midIdx])
        let rightArray = Array.init(array[midIdx..<array.count])
        
        let pArray = mergeSort_c(array: leftArray)
        let rArray = mergeSort_c(array: rightArray)
        
        let result = merge(array: array, pArray: pArray, qArray: rArray)
        return result
    }
    
    private func merge(array: [Int], pArray: [Int], qArray: [Int]) -> [Int] {
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
//        var index = 0
//        while i < pArray.count || j < qArray.count {
//            var left = 0
//            var right = 0
//
//            if i < pArray.count && j < qArray.count {
//                if left < right {
//                    result[index] = left
//                    i += 1
//                }else{
//                    result[index] = right
//                    j += 1
//                }
//            }else if i < pArray.count && j == qArray.count {
//                left = pArray[i]
//                result[index] = left
//
//            }else if j < qArray.count && i == pArray.count {
//                right = qArray[j]
//                result[index] = right
//            }
//
//            index += 1
//        }
        
        return result
    }
    
}
