# GOAL: allow an interior designer to enter the details of a given client
client_hash = {}
# 1. Greet designer/user
puts "Hello, welcome to the client management system. What is your name?"
user_name = gets.chomp

# 2. Prompt the desinger/user for information to enter
puts "Thank you, #{user_name}. Please enter the client's name:"
client_hash[:name] = gets.chomp
puts "Please enter the #{client_hash[:name]}'s age:"
client_hash[:age] = gets.chomp.to_i
puts "Please enter the number of children #{client_hash[:name]} has:"
client_hash[:children] = gets.chomp.to_i

# 3. Print hash back out to screen after designer has answered all of
# the questions
client_hash.each do |key, value|
    puts "#{key.capitalize}: #{value}"
end

# 4. Give the desinger to opporunity to update a key once.
# 5. If desinger says "none", skip step 4
# => if designer says :decor_theme for emaple, update :decore_theme key
# 6. Print the lastest version of the hash
# 7. Exit the program
