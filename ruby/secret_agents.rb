def encrypt(string)
  length = string.length
  index = 0
  while index < length
    if string[index] == ' '
      index += 1
      next
    else
      string[index] = string[index].next
      index += 1
    end
  end
  puts string
end

encrypt("abc")
encrypt("a b c")
