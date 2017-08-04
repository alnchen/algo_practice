# The string "PAYPALISHIRING" is written in a zigzag pattern on a
# given number of rows like this: (you may want to display this pattern
# in a fixed font for better legibility)

# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows:

def convert(s, num_rows)
# naive approach
  return s if num_rows == 1

  output = Array.new(num_rows){ Array.new}
  row = 0
  down = true
  s.length.times do |ltr_idx|
      if down
          output[row] << s[ltr_idx]
          row += 1
          if row == num_rows
              row = num_rows - 2
              down = false
          end
      else
          output[row] << s[ltr_idx]
          row -=1
          if row == -1
              down = true
              row += 2
          end
      end
  end
  output.flatten.join('')
end




# Write a function to find the longest common prefix string amongst an array of strings.
def longest_common_prefix(strs)
    return '' if strs.empty?
    word = strs.min_by {|word| word.length}
    while word.length >= 1
        end_idx = word.length - 1
        return word if strs.all? {|others| others[0..end_idx] == word}
        word.slice!(-1)
    end
    ""
end



# Given an array, find the int that appears an odd number of times.
# There will always be only one integer that appears an odd number of times.
def find_it(seq)
  h = Hash.new(0)
  seq.each do |i|
    h[i] += 1
  end
  h.each do |v, k|
    return v.to_i if k % 2 != 0
  end
end



# Write a function, persistence, that takes in a positive parameter num and returns
# its multiplicative persistence, which is the number of times you must multiply the
# digits in num until you reach a single digit.
def persistence(n)
  k = 0
   while n > 9 do
    n = n.to_s.split(//).map{|x| x.to_i}.inject(:*)
    k+=1
   end
  k
end



# You are going to be given an array of integers. Your job is to take that array
# and find an index N where the sum of the integers to the left of N is equal to the
# sum of the integers to the right of N. If there is no index that would make this happen, return -1.
def find_even_index(arr)
  arr.each_with_index do |num, idx|
    next if idx == arr.length - 1
    left_sum = arr[0...idx].reduce(:+)
    right_sum = arr[idx+1..-1].reduce(:+)
    return idx if left_sum == right_sum
  end
  -1
end

# p find_even_index([1,1,1,4,1,2])
# p find_even_index([2,4,2])


# You are given an array (which will have a length of at least 3, but could
# be very large) containing integers. The array is either entirely comprised of
# odd integers or entirely comprised of even integers except for a single integer N.
# Write a method that takes the array as an argument and returns N.
def find_outlier(integers)
  odd_arr = []
  even_arr = []
  integers.each do |n|
    if n.odd?
      odd_arr << n
    else even_arr << n
    end
    if odd_arr.length > 1 && even_arr.length == 1
      return even_arr[0]
    elsif even_arr.length > 1 && odd_arr.length == 1
      return odd_arr[0]
    end
  end
end


#given two strings, pattern ('abba') and input ('redbluebluered'). check for matching pattern
def word_pattern(pattern, input)
  # maybe helper method to get permutations of split string
  num_of_chars = pattern.chars.uniq.length
  first_word = 1
  while first_word < (num_of_chars - (first_word * 2)) / 2

  end
  0
end


# Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
# determine if the input string is valid.
def valid_parenthesis(string)
  stack = []
  brackets = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }
  string.chars.each do |char|
    if brackets.keys.include?(char)
      stack << char
    elsif brackets.values.include?(char)
      if stack[-1] == brackets.key(char)
        stack.pop
      else
        return false
      end
    else
      next
    end
  end
  true
end

# p valid_parenthesis('[{}]')
# p valid_parenthesis('[(])')
# p valid_parenthesis('[]{}()')

# Given a string, you need to reverse the order of characters in each word within a
# sentence while still preserving whitespace and initial word order.
# Input: "Let's take LeetCode contest"
# Output: "s'teL ekat edoCteeL tsetnoc"





# A left rotation operation on an array of size  shifts each of the array's elements
# unit to the left. For example, if  left rotations are performed on array , then the array would become .

# Given an array of  integers and a number, , perform  left rotations on the array.
# Then print the updated array as a single line of space-separated integers.
def rotate(ints, n)
  n.times { ints.push(ints.shift) }
  ints.join(' ')
end

# p rotate([1,2,3,4,5], 2)



# Given two strings,  and , that may or may not be of the same length, determine
# the minimum number of character deletions required to make  and  anagrams. Any
# characters can be deleted from either of the strings.
def min_deletions(str1, str2)
  a_hash = {}
  b_hash = {}
  diff = 0

  str1.split('').each { |ltr| a_hash[ltr] ? a_hash[ltr] += 1 : a_hash[ltr] = 1}
  str2.split('').each { |ltr| b_hash[ltr] ? b_hash[ltr] += 1 : b_hash[ltr] = 1}

  a_hash.each { |ltr, amt| b_hash[ltr] ? diff += (amt - b_hash[ltr]).abs : diff += amt }

  b_hash.each { |ltr, amt| diff += amt unless a_hash[ltr] }

  diff
end

# p min_deletions('hello', 'lol')
