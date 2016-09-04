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

def add_new_run(run_hash)
  new_run = Run.new(run_hash)
  id = new_run.save
  Run.where('id = ?', id).first
end

def print_run(run)
  puts "Duration: #{run.duration}"
  puts "Calories: #{run.calories}"
  puts "Location: #{run.location}"
  puts "Date: #{run.ran_at}"
  puts "User: #{run.user_id}"
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
|   |       Options              |
+---+----------------------------+
| 1 | Add New User               |
| 2 | Find User by Email Address |
+---+----------------------------+
TEXT

add_run_update_or_view_runs = <<-TEXT
+---+-------------------------+
|   |      Options            |
+---+-------------------------+
| 1 | Add a new run           |
| 2 | View all runs           |
| 3 | Update user information |
| 4 | Exit                    |
+---+-------------------------+
TEXT

puts add_or_find_user
user_input = gets.chomp.to_i
path = ''
user = nil
case user_input
when 1
  puts 'add new user'
when 2
  puts 'Please enter a valid email address:'
  email = gets.chomp
  user = find_user_by_email(email)
  print_user(user)
  path = 'email'
else
  puts 'please enter 1 or 2'
end

if path == 'email'
  puts add_run_update_or_view_runs
  user_input = gets.chomp.to_i
end

case user_input
when 1
  puts 'Add a new run'
  run_hash = {}
  run_hash['user_id'] = user.id
  puts 'Please enter the duration of the run in minutes:'
  run_hash['duration'] = gets.chomp.to_i
  puts 'Please enter calories burned during run:'
  run_hash['calories'] = gets.chomp.to_i
  puts 'Please enter the location of the run:'
  run_hash['location'] = gets.chomp
  puts 'Please enter the date of the run (YYYY-MM-DD):'
  run_hash['ran_at'] = gets.chomp
  new_run = add_new_run(run_hash)
  print_run(new_run)
when 2
  puts 'View all'
  p user.id
  runs = Run.where('user_id = ?', user.id)
  runs.each do |run|
    puts '=' * 30
    print_run(run)
  end
when 3
  puts 'Update user info'
when 4
  puts 'exiting....'
end
