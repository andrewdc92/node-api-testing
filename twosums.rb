def two_sum(nums, target)
  numbers_hash = {}
  nums.each_with_index do |number, index|
    numbers_hash[index] = number
    hash_key = ((numbers_hash.select { |k,v| v == (target - number) }.keys) - [index])
    hash_key.empty? ? false : (return [hash_key, index].flatten)
  end
  return "Couldn't find target value"
end

#wrong implementation below...study it

def two_sum(nums, target)
  numbers_hash = Hash[(0...nums.size).zip(nums)]
  numbers_hash.delete_if do |k, v|
    key_indicies = ((numbers_hash.select { |ki,vi| vi == (target - v) }.keys) - [k])
    key_indicies.empty? ? true : (return [k, key_indicies].flatten)
  end
  return "Couldn't find target value"
end

################

# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order and each of their nodes contain a single digit.
#  Add the two numbers and return it as a linked list.

# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
#
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    ret, cur = nil
    sum = 0

    loop {
        if not l1 and not l2
            cur.next = ListNode.new(sum) if cur and sum > 0
            # here, if l1 and l2 don't have nodes, assigns the first starting node as a new node instance
            # only executes if there is a cur_node and sum has been executed
            break
        end

        if l1 and l2
            # not carrying the 1- reassigns the 1 to sum at the last step of the loop
            sum += l1.val + l2.val
            l1 = l1.next
            l2 = l2.next
        elsif l1
            sum += l1.val
            l1 = l1.next
        else
            sum += l2.val
            l2 = l2.next
        end

        # first round of the loop, cur and ret don't exist (cur is current_node of output list, ret is the output list )
        if not cur
            ret = cur = ListNode.new(sum % 10)
        else
            cur = cur.next = ListNode.new(sum % 10)
        end

        sum /= 10
    }

    ret

end

def is_palindrome(525)

    x_rev = 0

    x_clone = 525
    while x_clone > 0
        x_rev = (x_rev * 10) + (x_clone % 10)
        # x rev = 0 + 5
        x_clone = x_clone / 10
          52= 525/10

    end

    x == x_rev
end

x_clone =
