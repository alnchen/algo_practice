=begin
As Amne expands, we will want to understand large-scale patterns in home values.

As we look at patterns across windows of certain sizes, we will need to efficiently
track trends such as increasing and decreasing subranges.

For this problem, you are given N days of average home sale price data, and a fixed
window size K . For each window of K days, from left to right, find the number of
increasing subranges within the window minus the number of decreasing subranges within the window.

A window of days is defined as a contiguous range of days. Thus, there are exactly
N-K+1 windows where this metric needs to be computed. An increasing subrange is
defined as a contiguous range of indices [a,b], a < b , where each element is larger
than the previous element. A decreasing subrange is similarly defined, except each
element is smaller than the next.
Constraints

1 ≤ N ≤ 200,000 days
1 ≤ K ≤ N days
Input Format

Your solution should accept an input file (input.txt) with the following contents:

 Line 1: Two integers, N and K.
 Line 2: N positive integers of average home sale price, each less than 1,000,000.
Output Format

Your solution should output one integer for each window’s result, with each integer
on a separate line, to an output file or to the console.

Sample Input

5 3
188930 194123 201345 154243 154243
Sample Output

3
0
-1
Explanation

For the first window of [188930, 194123, 201345], there are 3 increasing
subranges ([188930, 194123, 201345], [188930, 194123], and [194123, 201345])
and 0 decreasing, so the answer is 3. For the second window of [194123, 201345, 154243],
there is 1 increasing subrange and 1 decreasing, so the answer is 0. For the third window
of [201345, 154243, 154243], there is 1 decreasing subrange and 0 increasing, so the answer is -1.
Performance

Your solution should run in less than 30 seconds and use less than 50MB of memory
with a valid input of any size (within the given constraints).

Submission

Email your C, C++, Java, Python, or Javascript solution, along with a short
explanation (how your solution works, the techniques you used, etc.) and your
resume to challenge@amne.co. Be sure to test your solution before submission.
There is no submission deadline for this challenge.

Note: Gmail blocks Javascript attachments, so if your solution is written in
Javascript, please send it with a .txt extension (instead of .js).
=end



def subrange_difference(txt_data)
  parsed_data = File.readlines(txt_data).map { |line| line.chomp }
  length = parsed_data[0].split(' ')[0].to_i
  window_size = parsed_data[0].split(' ')[1].to_i
  # p window
  # p window.is_a?(Integer)
  price_data = parsed_data[1].split(' ').map { |price| price.to_i }

  (length - window_size + 1).times do |idx|
    p window_calculation(price_data[idx, window_size], window_size)
  end

end

def window_calculation(set, size)
  res = 0

  idx = 0
  while idx < size - 1
    idx2 = idx + 1

    while idx2 < size
      subrange = set[idx..idx2]
      increasing?(subrange) ? res += 1 : (res -= 1 if decreasing?(subrange))
      idx2 += 1
    end

    idx += 1
  end
  res
end

def increasing?(arr)
  (arr.length - 1).times { |idx| return false unless arr[idx] < arr[idx + 1] }
  true
end

def decreasing?(arr)
  (arr.length - 1).times { |idx| return false unless arr[idx] > arr[idx + 1] }
  true
end



# testing .txt file input and render
file = 'amne.txt'
subrange_difference(file)
