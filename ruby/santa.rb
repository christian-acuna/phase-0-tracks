class Santa
  def initialize
    puts 'Initialzing Santa instance...'
  end

  def speak
    puts 'Ho, ho, ho! Haaaappy holidays!'
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type.downcase}!"
  end
end

saint_nick = Santa.new
saint_nick.speak
saint_nick.eat_milk_and_cookies('Snickerdoodle')
saint_nick.eat_milk_and_cookies('Sugar cookie')
