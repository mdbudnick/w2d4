#bad_two_sum (brute force) time complexity = O(n * (n-1/2)) => O(n**2)

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |el, idx|
    (idx+1...arr.length).each do |idx2|
      return true if (arr[idx] + arr[idx2]) == target_sum
    end
  end

  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  arr.sort!
  upper_bound = arr.length
  arr.each_with_index do |el, idx|
    upper_bound = idx if el >= target_sum
  end

  (0...upper_bound).each do |idx|
    (idx+1...upper_bound).each do |idx2|
      return true if arr[idx] +  arr[idx2] == target_sum
    end
  end

  false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false