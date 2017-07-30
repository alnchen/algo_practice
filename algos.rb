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
