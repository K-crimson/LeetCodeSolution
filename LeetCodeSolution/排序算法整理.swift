//
//  排序算法整理.swift
//  LeetCodeSolution
//
//  Created by 车致远 on 2021/7/20.
//

import Foundation
class SortAlgorithms {
    enum SortType {
        case normal
        case optimized
    }
    //o(n^2)时间复杂度算法：
    class on2 {
        
        ///冒泡排序：
        func bubbleSort(type: SortType) -> (_ nums: [Int]) -> [Int] {
            
            //常规版本
            func normal(_ nums: [Int]) -> [Int] {
                var nums = nums
                for i in nums.indices {
                    for j in 0..<nums.count - 1 - i {
                        if nums[j] > nums[j + 1] {
                            nums.swapAt(j, j + 1)
                        }
                    }
                }
                return nums
            }
            
            func optimized(_ nums: [Int]) -> [Int] {
                var nums = nums
                var swaped = true
                for i in nums.indices {
                    if !swaped {
                        break
                    }
                    swaped = false
                    for j in 0..<nums.count - 1 - i {
                        if nums[j] > nums[j + 1] {
                            nums.swapAt(j, j + 1)
                            swaped = true
                        }
                    }
                }
                return nums
            }
            
            
            switch type {
            case .normal:
                return normal(_:)
            case .optimized:
                return optimized(_:)
            }
        }
        
        ///选择排序:
        func selectionSort(type: SortType) -> (_ nums: [Int]) -> [Int] {
            
            func normal(_ nums: [Int]) -> [Int] {
                var nums = nums
                for i in nums.indices {
                    var minIndex = i
                    for j in i..<nums.count {
                        if nums[j] < nums[minIndex] {
                            minIndex = j
                        }
                    }
                    nums.swapAt(i, minIndex)
                }
                return nums
            }
            
            /// 记录最大值 将最小值放到最左 最大值放到最右 很不好理解 也没有快很多 仍然是on2的时间复杂度
            func optimized(_ nums: [Int]) -> [Int] {
                var nums = nums
                for i in 0..<nums.count / 2 {
                    var minIndex = i
                    var maxIndex = i
                    var j = i + 1
                    while j < nums.count - i {
                        if nums[j] < nums[minIndex] {
                            minIndex = j
                        }
                        if nums[j] > nums[maxIndex] {
                            maxIndex = j
                        }
                        j += 1
                    }
                    if minIndex == maxIndex {
                        break
                    }
                    nums.swapAt(i, minIndex)
                    if (maxIndex == i) {
                        maxIndex = minIndex
                    }
                    nums.swapAt(nums.count - 1 - i, maxIndex)
                }
                return nums
            }
            
            switch type {
            case .normal:
                return normal(_:)
            default:
                return optimized(_:)
            }
        }
        
        ///插入排序:
        func insertSort(_ nums: [Int]) -> [Int] {
            var nums = nums
            for i in 1..<nums.count {
                var j = i
                while  j > 0 {
                    if nums[j] < nums[j - 1] {
                        nums.swapAt(j, j - 1)
                    }
                    j -= 1
                }
                
            }
                
            return nums
        }
    }
    
    ///onlogn排序算法
    class Onlogn {
       
        
        class MergeSort {
            func mergeSort(_ nums: inout [Int]) {
                sortHelper(&nums, lo: 0, hi: nums.count - 1)
            }
            
            func sortHelper(_ nums: inout [Int], lo: Int, hi: Int) {
                if lo >= hi {
                    return
                }
                
                let mid = (lo + hi) / 2
                sortHelper(&nums, lo: lo, hi: mid)
                sortHelper(&nums, lo: mid + 1, hi: hi)
                merge(&nums, lo: lo, mid: mid, hi: hi)
            }
            
            func merge(_ nums: inout [Int], lo: Int, mid: Int, hi: Int) {
                let arr = nums
                var i = lo, j = mid + 1
                for k in lo...hi {
                    if i > mid {
                        nums[k] = arr[j]
                        j += 1
                    } else if j > hi {
                        nums[k] = arr[i]
                        i += 1
                    } else if arr[i] < arr[j] {
                        nums[k] = arr[i]
                        i += 1
                    } else {
                        nums[k] = arr[j]
                        j += 1
                    }
                }
            }
        }
        
        class QuickSort {
            func quickSort(_ nums: inout [Int]) {
                sortHelper(&nums, lo: 0, hi: nums.count - 1)
            }
            
            func sortHelper(_ nums: inout [Int], lo: Int, hi: Int) {
                if lo >= hi {
                    return
                }
                let partitionNum = partition(&nums, lo: lo, hi: hi)
                sortHelper(&nums, lo: lo, hi: partitionNum - 1)
                sortHelper(&nums, lo: partitionNum + 1, hi: hi)
            }
            
            func partition(_ nums: inout [Int], lo: Int, hi: Int) -> Int {
                var pivot = nums[lo]
                var i = lo + 1, j = hi
                while true {
                    while nums[i] < pivot  {
                        i += 1
                        if i == hi {
                            break
                        }
                    }
                    while nums[j] > pivot {
                        j -= 1
                        if j == lo {
                            break
                        }
                    }
                    if i >= j {
                        break
                    }
                    nums.swapAt(i, j)
                }
                nums.swapAt(lo, j)
                return j
            }
        }
        
    }
    
}


