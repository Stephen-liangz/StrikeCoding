//
//  ViewController.swift
//  StrikeCoding
//
//  Created by 钟亮 on 2021/2/3.
//

import UIKit

class ViewController: UIViewController {

    var array = [1, 20, 3, 60, 100, 2, 2, 3, 6, 9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bubbleSort(array)
        selectSort(array)
        print("review ---- ")
        reviewBubbleSort(array)
        reviewBubbleSort(array)
    }

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

}

