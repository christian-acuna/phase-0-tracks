# Method declarations
def print_output(hash)
  hash.each do |key, value|
  puts "#{key.capitalize}: #{value}"
  end
end

def true_or_false(input)
  if input == 'y'
    true
  elsif input == 'n'
    false
  end
end

def number_to_formated_number(number)
  num_array = number.to_s.split('').map(&:to_i)
  '(%d%d%d) %d%d%d - %d%d%d%d' % num_array
end

# GOAL: allow an interior designer to enter the details of a given client
client_hash = {}
# 1. Greet designer/user
puts 'Hello, Welcome to the Client Management System 3000. What is your name?'
user_name = gets.chomp

# 2. Prompt the desinger/user for information to enter
puts "Thank you, #{user_name}. Please enter your client's name:"
client = client_hash[:name] = gets.chomp
puts "Please enter the #{client}'s age:"
client_hash[:age] = gets.chomp.to_i
puts "Please enter #{client}'s email:"
client_hash[:email] = gets.chomp
puts "Please enter client's phone number without spaces or characters:"
client_hash[:phone] = number_to_formated_number(gets.chomp)
puts "Please enter the number of children #{client_hash[:name]} has:"
client_hash[:children] = gets.chomp.to_i
puts "How many bedrooms are in #{client}'s house?"
client_hash[:bedrooms] = gets.chomp.to_i
puts "Does #{client} work from home? (Y/N)"
client_hash[:work_from_home] = true_or_false(gets.chomp.downcase)
puts "Has #{client} ever hired an interior designer? (Y/N)"
client_hash[:previous_designer] = true_or_false(gets.chomp.downcase)

puts 'Thank you for your input. Please wait while I process your information.'
puts '....................................................................'
puts '................................................................'
puts '..............................................................'
puts '...........................................................'
puts '........................................................'
puts '....................................................'
puts '.................................................'
puts '..............................................'
puts '...........................................'
puts '.......................................'
puts '....................................'

# 3. Print hash back out to screen after designer has answered all of
# the questions
puts '----------------------------------'
puts 'Here are your results:'
print_output(client_hash)
puts '----------------------------------'

# 4. Give the desinger to opporunity to update a key once.
puts "Thank you for waiting #{user_name}. Please double-check your input."
puts 'Type the name of the input form if you would like to update a form.'
puts "For example, type \"Bedrooms\" if you would like to update how many bedrooms #{client} has."
puts 'If all forms are correct, please type "none".'
update_key = gets.chomp.downcase.to_sym

# 5. If desinger says "none", skip step 4
if update_key == :none
  puts 'Thank you. No changes will be made.'
elsif client_hash.key?(update_key)
  puts "Please enter the updated value for #{update_key.capitalize}"
  client_hash[update_key] = gets.chomp
else
  puts 'Invaid form name.'
end

# 6. Print the lastest version of the hash
puts '--------------------------'
puts 'Here is your final output.'
# 7. Exit the program
print_output(client_hash)
