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
  # puts string
  string
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
  # puts string
  string
end

## ask user decrypt or encrypt
puts 'What is your agent number'
agent_number = gets.chomp
puts "Hello, agent #{agent_number}. Would you like to encrypt or decrypt a password?"
operation = gets.chomp.downcase
puts 'Plese enter a password:'
password = gets.chomp.downcase
puts 'Password recieved. Please wait....'
puts '....'
puts '......'
puts '.......'
puts '........'
puts '..........'

results = ''

if operation == 'encrypt'
  results = encrypt(password)
else
  results = decrypt(password)
end

puts "Operation complete. Your #{operation}ed password is: #{results}"

# TEST CASES
# encrypt('abc')
# encrypt('zed')
# encrypt('a b c')
# decrypt('bcd')
# decrypt('b c d')
# decrypt('afe')
#
# decrypt(encrypt('swordfish'))
# decrypt('txpsegjti')
