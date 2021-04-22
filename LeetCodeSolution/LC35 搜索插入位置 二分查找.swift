func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    var i = 0
    var j = nums.count - 1
    
    
    if target > nums.last! {
        return j + 1
    }
    
    while  i <= j {
        let mid = (i + j) / 2
        if nums[mid] > target {
            j -= 1
        } else if nums[mid] < target {
            i += 1
        }
        if nums[mid] == target {
            return mid
        }
        if i == j {
            return i
        }
    }
    
    return 0
}


