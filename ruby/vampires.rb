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
    true
  else
    false
  end
end

puts 'How many employees will be processed?'
number_of_employees = gets.chomp.to_i
count = 0
vampire = 5

while count < number_of_employees
  puts "Hello, employee number #{count + 1}."
  puts 'Welcome to our company. We are going to ask you a few questions.'
  puts 'What is you name?'
  name = gets.chomp
  puts 'How old are you?'
  age = gets.chomp.to_i
  puts 'Great, what year were you born?'
  year = gets.chomp.to_i
  pass_age_test = age_test(age, year)
  puts 'Our company cafeteria serves garlic bread.
  Should we order some for you? (Y/N)'
  bread = true_or_false(bread)
  puts 'Would you like to enroll in the company’s health insurance?'
  health_insurance = true_or_false(health_insurance)

  puts 'Please name any allergies you have. When you are done please type "done".'
  allergies_array = []
  allergy = gets.chomp.downcase
  
  if allergy == "sunshine"
    puts "Probably a vampire."
    next
  else

  vampire = 0 if pass_age_test && (health_insurance || bread)
  vampire = 1 if !pass_age_test && (!bread || !health_insurance)
  vampire = 2 if !pass_age_test && !bread && !health_insurance
  vampire = 3 if name == 'Drake Cula' || name == 'Tu Fang'
  count += 1
  case vampire
  when 0
    puts 'Probably not a vampire'
  when 1
    puts 'Probably a vampire'
  when 2
    puts 'Almost certanily a vampire'
  when 3
    puts 'Definitely a vampire'
  when 5
    puts 'Results inconclusive.'
  end
  puts '--------------------------------'
end
