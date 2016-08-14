require_relative '../alias_manager.rb'

describe 'split_name' do
  it 'splits a name into an array' do
    expect(split_name('Felicia Torres')).to eq(%w(Felicia Torres))
  end
end

describe 'reverse_names' do
  it 'reverse first and last name' do
    expect(reverse_names(%w(Felicia Torres))).to eq(%w(Torres Felicia))
  end
end

describe 'next_vowel_and_consonant' do
  it 'shifts vowel to next vowel' do
    expect(next_vowel_and_consonant('Torres')).to eq('Vussit')
  end

  it 'shifts Felicia to Gimodoe' do
    expect(next_vowel_and_consonant('Felicia')).to eq('Gimodoe')
  end

  describe 'vowel_or_consonant_shift(letter)' do
    it 'shifts vowel to next vowel' do
      expect(vowel_or_consonant_shift('a')).to eq('e')
    end

    it 'return "a" if given "u" (the last letter in vowel sequence)' do
      expect(vowel_or_consonant_shift('u')).to eq('a')
    end

    it 'shifts consonant by two letters if next letter is a vowel' do
      expect(vowel_or_consonant_shift('t')).to eq('v')
    end
  end

  describe 'shift_by' do
    it 'shifts z to b' do
      expect(shift_by(1, 'z')).to eq('b')
    end

    it 'shifts a letter by one' do
      expect(shift_by(1, 'c')).to eq('d')
    end

    it 'shifts a letter by two' do
      expect(shift_by(2, 't')).to eq('v')
    end
  end

  it 'shifts vowel to next vowel' do
    expect(next_vowel_and_consonant('Felicia')).to eq('Gimodoe')
  end
end

describe 'alias_manager' do
  it 'reverse names and shift vowels by one and constansts by one unless vowel' do
    expect(alias_manager('Felicia Torres')).to eq('Vussit Gimodoe')
  end
end
