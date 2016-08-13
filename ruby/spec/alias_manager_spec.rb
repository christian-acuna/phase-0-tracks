require_relative '../alias_manager.rb'

describe 'split name' do
  it 'splits a name into an array' do
    expect(split_name('Felicia Torres')).to eq(%w(Felicia Torres))
  end
end

describe 'reverse_names' do
  it 'reverse first and last name' do
    expect(reverse_names(%w(Felicia Torres))).to eq(%w(Torres Felicia))
  end
end

describe 'next_vowel_and_constant' do
  it 'shifts vowel to next vowel' do
    expect(next_vowel('Torres')).to eq('Vussit')
  end

  it 'shifts vowel to next vowel' do
    expect(next_vowel('Felicia')).to eq('Gimodoe')
  end
end


describe 'alias_manager' do
  it 'reverse names and shifts vowels by one and constansts by one unless vowel' do
    expect(alias_manager("Felicia Torres")).to eq('Vussit Gimodoe')
  end
end
