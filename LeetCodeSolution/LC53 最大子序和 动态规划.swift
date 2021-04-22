import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var result = dp[0]
    for i in 1..<nums.count {
        dp[i] = max(dp[i-1] + nums[i],nums[i])
        result = max(result, dp[i])
    }
    return result
}

