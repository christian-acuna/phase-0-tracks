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

puts 'Hello'
puts 'Welcome to our company. We are going to ask you a few questions.'
puts 'What is you name?'
name = gets.chomp
puts 'How old are you?'
age = gets.chomp.to_i
puts 'Great, what year were you born?'
year = gets.chomp.to_i
puts 'Our company cafeteria serves garlic bread. Should we order some for you? (Y/N)'
bread = true_or_false(bread)
puts 'Would you like to enroll in the company’s health insurance?'
health_insurance = true_or_false(health_insurance)
puts "break = #{bread} and health = #{health_insurance}"
