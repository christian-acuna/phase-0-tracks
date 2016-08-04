def encrypt(string)
  length = string.length
  index = 0
  while index < length
    if string[index] == ' '
      index += 1
      next
    elsif string[index] == 'z'
      string[index] = 'a'
      index += 1
    else
      string[index] = string[index].next
      index += 1
    end
  end
  puts string
end

def decrypt(string)
  length = string.length
  index = 0
  chars = 'abcdefghijklmnopqrstuvwxyz'

  while index < length
    if string[index] == ' '
      index += 1
      next
    else
      char_num = chars.index(string[index]) - 1
      string[index] = chars[char_num]
      index += 1
    end
  end
  puts string
end

encrypt('abc')
encrypt('zed')
encrypt('a b c')
decrypt('bcd')
decrypt('b c d')
decrypt('afe')
