class Santa
  # getter methods
  attr_reader :age, :ethnicity, :gender

  # setter and getter methods
  attr_accessor :gender

  def initialize(gender, ethnicity)
    puts 'Initialzing Santa instance...🎅'
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = %w(Rudolph Dasher Dancer Prancer Vixen
                           Comet Cupid Donner Blitzen)
    @age = rand(0..100)
  end

  def speak
    puts 'Ho, ho, ho! Haaaappy holidays!🎄 🎁 ⛄'
    puts "I am #{@gender} and my ethnicity is #{@ethnicity}."
    puts "I am #{@age} years old." unless @age == 1
    puts "I am #{@age} year old." if @age == 1
  end

  def change_birthday
    @age += 1
  end

  def get_mad_at(target)
    removed_reindeer = @reindeer_ranking.delete(target)
    puts "Santa is mad at #{removed_reindeer}! 😠"
    puts "Santa is putting #{removed_reindeer} at the back of his ranking."
    @reindeer_ranking << removed_reindeer
  end

  def eat_milk_and_cookies(cookie_type)
    puts "Yumm!! That was a good #{cookie_type.downcase}!"
  end
end

### Helper Method
def generate_santas(number)
  example_genders = ['agender', 'female', 'bigender', 'male', 'female',
                     'gender fluid', 'N/A']
  example_ethnicities = ['black', 'Latino', 'white', 'Japanese-African',
                         'prefer not to say', 'Mystical Creature (unicorn)',
                         'N/A']
  santas = []
  number.times do
    random_number1 = rand(0..6)
    random_number2 = rand(0..6)
    santas << Santa.new(example_genders[random_number1],
                        example_ethnicities[random_number2])
  end
  santas
end

### Diver Code

santas_array = generate_santas(100)

example_cookies = ['sugar cookie', 'snickerdoodle', 'oatmeal cookie',
                   'christmas cookie', 'chocolate chip cookie',
                   'coconut macaroon', 'peanut butter cookie']

santas_array.each do |santa|
  santa.change_birthday
  santa.speak
  santa.eat_milk_and_cookies(example_cookies[rand(0..6)])

  reindeer = %w(Rudolph Dasher Dancer Prancer Vixen
                       Comet Cupid Donner Blitzen)
  santa.get_mad_at(reindeer[rand(0..7)])

  gender_change = ['agender', 'female', 'bigender', 'male', 'female',
                     'gender fluid', 'N/A']

  santa.gender = gender_change[rand(0..6)]
  puts "My changed gender is #{santa.gender}."
  puts '-' * 80
end
#
# first_santa = santas.first
# first_santa.get_mad_at('Rudolph')
# p first_santa.age
# first_santa.change_birthday
# p first_santa.age
