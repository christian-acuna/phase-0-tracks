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
p "The case of the disappearing last letter"[0..-2]
p "The case of the disappearing last letter"[0...-1]
p "The case of the disappearing last letter".slice(0...-1)
p "The case of the disappearing last letter".slice(0..-2)
p "The case of the disappearing last letter".chop
p "The case of the disappearing last letter".chomp("r")
# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"
p "The mystery of the missing first letter".slice(1..-1)
p "The mystery of the missing first letter"[1..-1]
p "The mystery of the missing first letter".reverse.chop.reverse
p "The mystery of the missing first letter".gsub(/^./, "")

# "Elementary,    my   dear        Watson!".<???>
p "Elementary,    my   dear        Watson!".squeeze(" ")
p "Elementary,    my   dear        Watson!".split.join(" ")
# \s+ means 1 or more whitespace characters (space, newline, tab).
p "Elementary,    my   dear        Watson!".gsub(/\s+/, " ")
# => "Elementary, my dear Watson!"

p "z".ord
p "z".sum
# => 122
# (What is the significance of the number 122 in relation to the character z?)
# "z".ord returns the ascii code of z
# "z".sum returns the sum of the binary value of each character. In this case
# there is only once character

p "How many times does the letter 'a' appear in this string?".count 'a'
p "How many times does the letter 'a' appear in this string?".scan(/a/).length
# => 4
