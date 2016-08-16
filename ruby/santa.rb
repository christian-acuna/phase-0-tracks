class Santa
  # getter methods
  attr_reader :age, :ethnicity, :gender

  # setter methods
  attr_accessor :gender

  def initialize(gender, ethnicity)
    puts 'Initialzing Santa instance...'
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = %w(Rudolph Dasher Dancer Prancer Vixen
                           Comet Cupid Donner Blitzen)
    @age = 0
  end

  def speak
    puts 'Ho, ho, ho! Haaaappy holidays!'
    puts "I am #{@gender} and my ethnicity is #{@ethnicity}. I am #{@age} years old."
  end

  def change_birthday
    @age += 1
  end

  def get_mad_at(target)
    removed_reindeer = @reindeer_ranking.delete(target)
    @reindeer_ranking << removed_reindeer
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type.downcase}!"
  end
end

saint_nick = Santa.new('male', 'hispanic')
saint_nick.speak
saint_nick.eat_milk_and_cookies('Snickerdoodle')
saint_nick.eat_milk_and_cookies('Sugar cookie')

saint_nick = Santa.new('female', 'white')
saint_nick.speak
saint_nick.eat_milk_and_cookies('Snickerdoodle')
saint_nick.eat_milk_and_cookies('Sugar cookie')

santas = []
example_genders = ['agender', 'female', 'bigender', 'male', 'female', 'gender fluid', 'N/A']
example_ethnicities = ['black', 'Latino', 'white', 'Japanese-African', 'prefer not to say', 'Mystical Creature (unicorn)', 'N/A']
example_cookies = ['sugar cookie', 'snickerdoodle', 'oatmeal', 'christmas cookie',
                   'chocolate chip cookie', 'coconut macaroon', 'peanut butter cookie']

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santas.each_with_index do |santa, index|
  santa.speak
  santa.eat_milk_and_cookies(example_cookies[index])
  santa.gender = 'N/A'
  puts "My changed gender is #{santa.gender}"
end

first_santa = santas.first
first_santa.get_mad_at('Rudolph')
p first_santa.age
first_santa.change_birthday
p first_santa.age
