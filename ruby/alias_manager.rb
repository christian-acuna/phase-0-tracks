require ('byebug')
def alias_manager(name)
  name_array = split_name(name)
  reversed_array = reverse_names(name_array)
  first_name = reversed_array[0]
  last_name = reversed_array[1]

  shifted_first = next_vowel(first_name)
  shifted_last = next_vowel(last_name)
  "#{shifted_first} #{shifted_last}"
end

def split_name(name)
  name.split(' ')
end


def reverse_names(name_array)
  name_array.reverse
end
# "#{name_array[1]} #{name_array[0]}"

def next_vowel(first_name)
  char_array = first_name.downcase.chars
  char_array.map! do |letter|
    if "aeiou".include?(letter)
      vowels = %w(a e i o u)
      next_vowel_index = (vowels.index(letter) + 1) % 5
      letter = vowels[next_vowel_index]
    else
      if 'aeiou'.include?(letter.next)
        letter = letter.next.next
      else
        letter = letter.next
      end
    end
  end
  char_array.join.capitalize
end

p next_vowel('Torres')
p next_vowel('Felicia')
