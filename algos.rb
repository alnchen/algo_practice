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
  # make hashes of the number of letters in each string and get total difference
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




#binary tree
#traversing (in-order, pre-order, post-order)
# in-order: left, root, right
# pre-order: root, left, right
# post-order: left, right, root

# Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
# Input:
#     3
#    / \
#   9  20
#     /  \
#    15   7
# Output: [3, 14.5, 11]
def average_of_levels(root)
  count = []
  res = []
  average(root, 0, res, count)
  res.each_with_index { |sum, idx| res[idx] = sum.to_f / count[idx]}
end

def average(node, level, res_of_nodelvl, count_of_nodelvl)
  # pass in same level count to children of same node which adds sum and # of nodes in parent function's count/res
  return if node == nil
  res_of_nodelvl[level] ? res_of_nodelvl[level] += node.val : res_of_nodelvl[level] = node.val
  count_of_nodelvl[level] ? count_of_nodelvl[level] += 1 : count_of_nodelvl[level] = 1

  average(node.left, level + 1, res_of_nodelvl, count_of_nodelvl)
  average(node.right, level + 1, res_of_nodelvl, count_of_nodelvl)
end





# Given the words in the magazine and the words in the ransom note, print Yes if he can
# replicate his ransom note exactly using whole words from the magazine; otherwise, print No.
def enough_words?(magazine, ransom)
  magazine_words = {}
  ransom_words = {}

  magazine.each { |word| magazine_words[word] ? magazine_words[word] += 1 : magazine_words[word] = 1}
  ransom.each { |word| ransom_words[word] ? ransom_words[word] += 1 : ransom_words[word] = 1}

  ransom_words.each do |word, reps|
     if !magazine_words[word] || magazine_words[word] <  reps
         return 'No'
     end
  end

  'Yes'
end

# p enough_words?(['hello', 'how', 'are', 'you'], ['hello', 'you'])




# Given  strings of brackets, determine whether each sequence of brackets is balanced.
# If a string is balanced, print YES on a new line; otherwise, print NO on a new line.
def balanced_brackets(str)
  stack = []
  brackets = {
      '(' => ')',
      '[' => ']',
      '{' => '}'
      }

  str.strip.split('').each do |char|
      if brackets.keys.include?(char)
          stack.push(char)
      elsif brackets.values.include?(char)
          if stack.last != brackets.key(char)
              return false
          else
              stack.pop
          end
      else
          next
      end
  end

  stack.empty? ? true : false
end

# p balanced_brackets('[]')
# p balanced_brackets('[(])')
# p balanced_brackets('[()]{')




# bubblesort
def bubblesort(array)
  swaps = 0
  sorted = false
  length = array.length
    until sorted
        sorted = true
        idx = 0
        while idx < length - 1
          if array[idx] > array[idx +1]
            array[idx], array[idx+1] = array[idx+1], array[idx]
            swaps += 1
            sorted = false
          end
          idx += 1
        end
    end
  p swaps
  array
end

# p bubblesort([1,2,3,1])





# You are given a string of numbers between 0-9. Find the average of these numbers and
# return it as a floored whole number (ie: no decimal places) written out as a string. Eg:
# "zero nine five two" -> "four"
def average_string(s)
  return 'n/a' if s == ''
  values = {
    'zero' => 0,
    'one' => 1,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9
  }

  sum = 0
  nums = s.split(' ')

  nums.each do |num|
    return 'n/a' unless values[num]
    sum += values[num]
  end

  values.key(sum/nums.length)
end





# Write a function that will return the count of distinct case-insensitive
# alphabetic characters and numeric digits that occur more than once in the input
# string. The input string can be assumed to contain only alphabets
# (both uppercase and lowercase) and numeric digits.
def duplicate_count(text)
    hash = {}
    chars = text.split('')

    chars.each do |char|
      if hash[char.downcase]
        hash[char.downcase] += 1
      else
        hash[char.downcase] = 1
      end
    end

    hash.count { |char, amt| amt > 1 }
end



# Here are some children, each with a certain number of apples. Now we
# have to do something to make the number of apples of each child are equal.
def min_steps(apples)
  return 0 if apples.max == apples.min
  avg = apples.reduce(:+) / apples.size.to_f
  r = apples.map {|x| x - avg}
  return -1 unless r.all? {|i| i % 2 == 0}
  r.select {|z| z > 0}.reduce(:+) / 2
end





# Your task in this kata is to implement a function that, given a list of
# pepes (pepes), returns the rarest pepe in the list. If two or more pepes are
# equally rare, return a list of these pepes, sorted in alphabetical order.
def find_rarest_pepe(pepes)
  counts = {}
  pepes.each { |pepe| counts[pepe] ? counts[pepe] += 1 : counts[pepe] = 1 }
  return 'No rare pepes!' if counts.values.uniq.length == 1 || pepes.empty?
  min = counts.values.min
  output = counts.select { |pepe, count| count == min }.keys
  output.length == 1 ? output[0] : output.sort
end

pepes = ['Donald Trump Pepe',
           'Melania Trump Pepe',
           'Clown Pepe',
           'Clown Pepe',
           'Donald Trump Pepe']

# p find_rarest_pepe(pepes)




# custom fibs
# given signature (starting seq and also length = prev window range)
# indexes = indices of nums to sum up within the prev window range
# n = return index

def custom_fib(signature,indexes,n)
  length = signature.length

  while signature.length <= n
    cur_val = 0
    cur_window = signature[-length..-1]
    indexes.each { |idx| cur_val += cur_window[idx] }
    signature.push(cur_val)
  end

  signature[n]
end




# Implement an EventEmitter class with two methods, on() and trigger().
#
# On allows you to 'subscribe' to an event, passing in a key as a parameter,
# and a Ruby block to be executed when this particular event is triggered.
#
# The trigger method accepts a key as a parameter. The trigger method calls
# all blocks that have been subscribed to the key parameter. This method should
# return an array of all of the blocks for the key parameter.
#
# triggering a key which has no subscribed blocks should return an empty array.
class EventEmitter
  def initialize
    @stack = {}
  end

  def on(key, &block)
    @stack[key] ? @stack[key] << block : @stack[key] = [block]
  end

  def trigger(key)

    @stack[key] ? @stack[key].each(&:call) : []
  end
end

e = EventEmitter.new

e.on('foo') { puts 'foo' }
e.on('foo') { puts 'bar' }
e.on('foo') { puts 'baz' }

e.trigger('foo')
# => 'foo'
# => 'bar'
# => 'baz'
