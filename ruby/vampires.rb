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

# test age of employee
def age_test(age, year_born)
  current_year = 2016
  if current_year - year_born == age
    true
  else
    false
  end
end

# print results to console
def survery_results(vampire_level)
  case vampire_level
  when 0
    puts 'Probably not a vampire'
  when 1 || 6
    puts 'Probably a vampire'
  when 2
    puts 'Almost certainly a vampire'
  when 3
    puts 'Definitely a vampire'
  when 5
    puts 'Results inconclusive.'
  end
  puts '--------------------------------'
end

###### Start of Program
# ask how many employees will be surveyed
puts 'How many employees will be processed?'
number_of_employees = gets.chomp.to_i
count = 0
vampire = nil

# Perform a loop until the count is greater than the number of employeees
while count < number_of_employees
  puts "Hello, employee number #{count + 1}."
  puts 'Welcome to our company. We are going to ask you a few questions.'
  # get name of employee
  puts 'What is you name?'
  name = gets.chomp
  # ask age
  puts 'How old are you?'
  age = gets.chomp.to_i
  # ask year born
  puts 'Great, what year were you born?'
  year = gets.chomp.to_i
  # perform age test method
  pass_age_test = age_test(age, year)
  # ask if they want garlic bread
  puts 'Our company cafeteria serves garlic bread.
  Should we order some for you? (Y/N)'
  bread = true_or_false(bread)
  #ask if they would like to be enrolled in health insurace
  puts 'Would you like to enroll in the company’s health insurance?'
  health_insurance = true_or_false(health_insurance)

  # ask for allergy inventory
  puts 'Please name any allergies you have. When you are done please type "done".'
  allergies_array = []
  allergy = gets.chomp.downcase

  # perform until user types done or sunshine
  until allergy == 'done'
    if allergy == 'sunshine'
      vampire = 6
      break
    else
      puts 'Allergy noted. Please list next allergy:'
      allergy = gets.chomp.downcase
      allergies_array << allergy
    end
  end

  vampire = 0 if pass_age_test && (health_insurance || bread)
  vampire = 1 if !pass_age_test && (!bread || !health_insurance)
  vampire = 2 if !pass_age_test && !bread && !health_insurance
  vampire = 3 if name == 'Drake Cula' || name == 'Tu Fang'
  # print results of vampire score to console
  survery_results(vampire)
  count += 1
end
puts "Actually, never mind! What do these questions have to do with anything?
Let's all be friends."
