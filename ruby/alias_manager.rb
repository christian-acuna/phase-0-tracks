require 'byebug'

def alias_manager(real_name)
  name_array = split_name(real_name)
  reversed_array = reverse_names(name_array)

  shifted_array = reversed_array.map do |name|
    next_vowel_and_consonant(name)
  end

  shifted_array.join(' ')
end

def split_name(name)
  name.split(' ')
end

def reverse_names(name_array)
  name_array.reverse
end

def next_vowel_and_consonant(name)
  char_array = name.downcase.chars
  char_array.map! do |letter|
    vowel_or_consonant_shift(letter)
  end
  char_array.join.capitalize
end

def vowel_or_consonant_shift(letter)
  vowels = 'aeiou'
  if vowels.include?(letter)
    letter = shift_vowel(letter)
  elsif vowels.include?(letter.next)
    shift_by(2, letter)
  else
    shift_by(1, letter)
  end
end

def shift_vowel(letter)
  vowels = 'aeiou'
  next_vowel_index = (vowels.index(letter) + 1) % 5
  vowels[next_vowel_index]
end

def shift_by(num, letter)
  if num == 1
    letter.next
  else
    letter.next.next
  end
end

p alias_manager('Felicia Torres')
