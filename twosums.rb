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
