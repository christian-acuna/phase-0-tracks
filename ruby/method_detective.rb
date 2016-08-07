# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

p "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

p "zom".insert(1, 'o')
# => “zoom”

p "enhance".center(15)
# => "    enhance    "

p "Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

# "the usual".<???>
p "the usual" << " suspects"
p "the usual" + " suspects"
#=> "the usual suspects"

p " suspects".prepend("the usual")
# => "the usual suspects"

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

p "z".ord
p "z".sum
# => 122
# (What is the significance of the number 122 in relation to the character z?)
# "z".ord returns the ascii code of z
# "z".sum returns the sum of the binary value of each character. In this case
# there is only once character

# "How many times does the letter 'a' appear in this string?".<???>
# => 4
