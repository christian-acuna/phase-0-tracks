require './run.rb'
require './user.rb'
require './setup.rb'

def find_user_by_email(email)
  User.where('email = ?', email).first
end

def print_user(user)
  puts "First name: #{user.first_name}"
  puts "Last name: #{user.last_name}"
  puts "Gender: #{user.gender}"
  puts "Email: #{user.email}"
end
#########
puts 'Hello, Welcome to the Run Tracker app.'
hello_there = <<-HELLO
           _________    .-----------------------------.
          ////////\\\\\\\  (  What would you like to do?' )
         // __   __ \\\\ /'-----------------------------'
        // (()) (()) \\\\
       (_    (___)    _)
         \\  \\_____/  /
          `-._   _.-'
          __.-)_(-,__
       ./'  \\_\\_/_/  `\\.
      / >   | //\\ |   < \\
     /  \\   | |/| |   /  \\
    /   |\\  | |/| |  /|   \\
   /   /| \\ | |/| | / |\\   \\
  (   ( |  \\| |/| |/  | )   )
   \\   \\|   Y |/| Y   |/   /
    \\   |  o| |/| |-  |   /
     `\\ |   | `^` |   | /'
       `|  o|=[Ll=|-  |'
        |   /     \\   |
        ~~|`  \\    `|~~
          |    |    |
          |    |    |
          |    |    |
          |    |    |
          |    |    |
          |    |    |
          |    |    |
          |    |    |
          |____|____|
          /   / \\   \\
         /   /   \\   \\
        `---'     `---`
HELLO
puts hello_there
add_or_find_user = <<-TEXT
+---+----------------------------+
|   |        Action              |
+---+----------------------------+
| 1 | Add New User               |
| 2 | Find User by Email Address |
+---+----------------------------+
TEXT

puts add_or_find_user
user_input = gets.chomp.to_i

case user_input
when 1
  puts 'add new user'
when 2
  puts 'Please enter a valid email address:'
  email = gets.chomp
  user = find_user_by_email(email)
  print_user(user)
else
  puts 'please enter 1 or 2'
end
