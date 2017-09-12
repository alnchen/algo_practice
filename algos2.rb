require 'set'

=begin
Sherlock considers a string, , to be valid if either of the following
conditions are satisfied:

All characters in  have the same exact frequency (i.e., occur the same
number of times). For example,  is valid, but  is not valid.
Deleting exactly  character from  will result in all its characters
having the same frequency. For example,  and  are valid because all
their letters will have the same frequency if we remove occurrence of c,
but  is not valid because we'd need to remove  characters.

Given , can you determine if it's valid or not? If it's valid, print
YES on a new line; otherwise, print NO instead.

=end


# needs to be optimized
def isValid(s)
    counts = {}
    diff = 0
    common = {}
    single_letter = false

    s.chars.each do |letter|
       counts[letter] ? counts[letter] += 1 : counts[letter] = 1
    end

    counts.values.each do |count|
        common[count] ? common[count] += 1 : common[count] = 1
    end

    occurence = common.max_by { |k, val| val }.first

    if occurence > 1 && counts.select { |k, v| v == 1 }.length == 1
        if counts.select { |k, v| v == occurence }.length == counts.length - 1
            return 'YES'
        end
    end

    counts.values.each do |value|
        diff += (value - occurence).abs
        return 'NO' if diff > 1
    end

    'YES'
end

str = "ibfdgaeadiaefgbhbdghhhbgdfgeiccbiehhfcggchgghadhdhagfbahhddgghbdehidbibaeaagaeeigffcebfbaieggabcfbiiedcabfihchdfabifahcbhagccbdfifhghcadfiadeeaheeddddiecaicbgigccageicehfdhdgafaddhffadigfhhcaedcedecafeacbdacgfgfeeibgaiffdehigebhhehiaahfidibccdcdagifgaihacihadecgifihbebffebdfbchbgigeccahgihbcbcaggebaaafgfedbfgagfediddghdgbgehhhifhgcedechahidcbchebheihaadbbbiaiccededchdagfhccfdefigfibifabeiaccghcegfbcghaefifbachebaacbhbfgfddeceababbacgffbagidebeadfihaefefegbghgddbbgddeehgfbhafbccidebgehifafgbghafacgfdccgifdcbbbidfifhdaibgigebigaedeaaiadegfefbhacgddhchgcbgcaeaieiegiffchbgbebgbehbbfcebciiagacaiechdigbgbghefcahgbhfibhedaeeiffebdiabcifgccdefabccdghehfibfiifdaicfedagahhdcbhbicdgibgcedieihcichadgchgbdcdagaihebbabhibcihicadgadfcihdheefbhffiageddhgahaidfdhhdbgciiaciegchiiebfbcbhaeagccfhbfhaddagnfieihghfbaggiffbbfbecgaiiidccdceadbbdfgigibgcgchafccdchgifdeieicbaididhfcfdedbhaadedfageigfdehgcdaecaebebebfcieaecfagfdieaefdiedbcadchabhebgehiidfcgahcdhcdhgchhiiheffiifeegcfdgbdeffhgeghdfhbfbifgidcafbfcd"

# p isValid(str)





=begin
Sandy likes palindromes. A palindrome is a word, phrase, number, or other
sequence of characters which reads the same backward as it does forward.
For example, madam is a palindrome.

On her birthday, Sandy's uncle, Richie Rich, offered her an n-digit check
which she refused because the number was not a palindrome. Richie then
challenged Sandy to make the number palindromic by changing no more than
digits. Sandy can only change  digit at a time, and cannot add digits to
(or remove digits from) the number.

Given K and an n-digit number, help Sandy determine the largest possible
number she can make by changing digits. Return -1 if she cannot change
=end

def richie_rich(number_str, changes)
  # length = number_str.chars.length
  #
  # idx = 0
  # while idx < length / 2
  #
  #   unless number_str[idx] == number_str[length - idx - 1]
  #     if (length/2) - idx > changes
  #       number_str[idx] = '9'
  #       number_str[length - idx - 1] = '9'
  #       changes -= 2
  #     else
  #       number_str[idx].to_i > number_str[length - idx - 1].to_i ?
  #       number_str[length - idx - 1] = number_str[idx] :
  #       number_str[idx] = number_str[length - idx - 1]
  #       changes -= 1
  #     end
  #     return -1 if changes < 0
  #   end
  #
  #   idx += 1
  # end
  #
  # idx = 0
  # until idx >= length / 2 || changes < 2
  #   number_str[idx] = '9'
  #   number_str[length - idx - 1] = '9'
  #   changes -= 2
  # end
  #
  # number_str
end

# p richie_rich('3943', 1)
# => 3993
# p richie_rich('092282', 3)
# => 992299




# set = Set.new
# set.add(4)
# set.add(5)
# set.add(4)
# set.add(6)
# set.add(5)
#
# set2 = Set.new
# set2.add(4)
# set2.add(6)
# set2.add(5)
#
# p set == set2

def anagram?(str1, str2)
  return false if str1.length != str2.length
  set1 = Set.new
  set2 = Set.new

  str1.chars.each { |char| set1.add(char) }
  str2.chars.each { |char| set2.add(char) }

  return false if set1 != set2
  true
end

# p anagram?('stressed', 'desserts')
