puts "Hello there, what is your name?"
name = gets.chomp
puts "Oh, nice to meet you #{name}! How old are you?"
age = gets.chomp.to_i
puts "Wow, you don't look #{age}. What year were you born?"
year = gets.chomp.to_i
if 2016 - year == age
  puts "That's great to know\n."
else
  puts "No way!\n"
end
puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_bread = gets.chomp
puts "Thanks. Lastly, would you like to enroll in the company’s health insurance?"
health_insurance = gets.chomp
puts "Thank you for your time. We will contact you soon."

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
