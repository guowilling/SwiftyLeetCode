//
// 747. 至少是其他数字两倍的最大数
//
// https://leetcode-cn.com/problems/largest-number-at-least-twice-of-others/
//
// 在一个给定的数组nums中，总是存在一个最大元素 。
// 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。
// 如果是，则返回最大元素的索引，否则返回-1。
//
// 示例 1:
// 输入: nums = [3, 6, 1, 0]
// 输出: 1
// 解释: 6是最大的整数, 对于数组中的其他整数,
// 6大于数组中其他元素的两倍。6的索引是1, 所以我们返回1.
//
// 示例 2:
// 输入: nums = [1, 2, 3, 4]
// 输出: -1
// 解释: 4没有超过3的两倍大, 所以我们返回 -1.
//
// 提示:
// 1.nums 的长度范围在[1, 50].
// 2.每个 nums[i] 的整数范围在 [0, 100].
//

/// O(n), O(1)
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var largest = 0, largestIndex = 0
        for (index, num) in nums.enumerated() {
            if num > largest {
                largest = num
                largestIndex = index
            }
        }
        for num in nums {
            if num == largest { continue }
            if largest < num * 2 { return -1 }
        }
        return largestIndex
    }
}

let s = Solution()
assert(s.dominantIndex([3, 6, 1, 0]) == 1)
assert(s.dominantIndex([1, 2, 3, 4]) == -1)
