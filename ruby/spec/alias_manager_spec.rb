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
end
