def get_rock_index(quantity)
    counts = {}
    output_idx = nil
    most_occurences = 0
    ned = quantity.sort
    geo = []

    #find geo's set
    quantity.each_index { |idx| geo.push(quantity[idx] + ned[idx]) }

    #get a running count using the counts hash table for better time complexity through O(1) lookup
    geo.each_with_index do |val, idx|
        counts[val] ? counts[val] += 1 : counts[val] = 1
        if counts[val] > most_occurences
            output_idx = idx
            most_occurences = counts[val]
        elsif counts[val] == most_occurences
            output_idx = idx if val == geo[output_idx] || val > geo[output_idx]
        else
            next
        end
    end


    output_idx
end




def encode_string(s)
    alpha = ("a".."z").to_a
    counts = {}
    temp_string = s.delete('aeiou')
    to_encode = ''
    output = ''

    #use counts hashtable for checking for repeats with a more time efficient
    #method and append to the pre-encoded string "to_encoded"
    temp_string.chars.each do |ltr|
        unless counts[ltr]
            to_encode += ltr
            counts[ltr] = true
        end
    end

    #find length here to keep code dry and also to improve time complexity
    length = to_encode.chars.length

    #find index of new character by finding index of current and next
    #character, offsetting index by 1 or 2 and appending to output string
    to_encode.chars.each_with_index do |ltr, idx|
        if idx == length - 1
            new_idx = ((alpha.index(ltr) + alpha.index(to_encode[0])) + 2) % 26 - 1
        else
            new_idx = ((alpha.index(ltr) + alpha.index(to_encode[idx+1])) + 2) % 26 - 1
        end

        output += alpha[new_idx]
    end

    output
end
