require 'byebug'

def true_or_false(item)
  item = gets.chomp.downcase
  until item == true || item == false
    if item == 'y'
      item = true
    elsif item == 'n'
      item = false
    else
      puts 'Please input Y or N.'
      item = gets.chomp.downcase
    end
  end
  item
end

def age_test(age, year_born)
  current_year = 2016
  if current_year - year_born == age
    false
  else
    true
  end
end

puts 'Hello'
puts 'Welcome to our company. We are going to ask you a few questions.'
puts 'What is you name?'
name = gets.chomp
puts 'How old are you?'
age = gets.chomp.to_i
puts 'Great, what year were you born?'
year = gets.chomp.to_i
fail_age_test = age_test(age, year)
puts 'Our company cafeteria serves garlic bread.
Should we order some for you? (Y/N)'
bread = true_or_false(bread)
puts 'Would you like to enroll in the company’s health insurance?'
health_insurance = true_or_false(health_insurance)
puts "bread = #{bread} and health = #{health_insurance}"
