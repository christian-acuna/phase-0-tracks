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

def add_new_user(user_hash)
  new_user = User.new(user_hash)
  id = new_user.save
  User.where('id = ?', id).first
end

def print_run(run)
  puts "Duration: #{run.duration}"
  puts "Calories: #{run.calories}"
  puts "Location: #{run.location}"
  puts "Date: #{run.ran_at}"
  puts "User: #{run.user_id}"
end



def update_user(user)
  update_input = nil
  print_user(user)
  until update_input == 5
    update_user_options = <<-TEXT
    +---+-------------------------+
    |   |      Options            |
    +---+-------------------------+
    | 1 | First name              |
    | 2 | Last name               |
    | 3 | Gender                  |
    | 4 | Email                   |
    | 5 | Done                    |
    +---+-------------------------+
    TEXT
    puts 'What do you want to update?'
    puts update_user_options
    update_input = gets.chomp.to_i
    case update_input
    when 1
      puts 'Please enter a new first name:'
      user.first_name = gets.chomp
    when 2
      puts 'Please enter a new last name:'
      user.last_name = gets.chomp
    when 3
      puts 'Please enter a new gender (M/F):'
      user.gender = gets.chomp
    when 4
      puts 'Please enter a new email:'
      user.email = gets.chomp
    else
      puts 'Please enter a vaid number 1 - 5'
    end
    user.save
  end
  puts '=' * 30
  puts 'Here is your updated information:'
  print_user(user)
end

# Driver Code
#########
puts 'Hello, Welcome to the Run Tracker app.'
hello_there = <<-HELLO
           _________    .-----------------------------.
          ////////\\\\\\\  (  What would you like to do?  )
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
| 1 | Add new user               |
| 2 | Find user by email address |
| 3 | Exit                       |
+---+----------------------------+
TEXT

add_run_update_or_view_runs = <<-TEXT
+---+-------------------------+
|   |      Options            |
+---+-------------------------+
| 1 | Add a new run           |
| 2 | View all runs           |
| 3 | Update user information |
| 4 | Back                    |
+---+-------------------------+
TEXT

user_input = nil
until user_input == 3
  puts add_or_find_user
  user_input = gets.chomp.to_i
  path = ''
  user = nil
  case user_input
  when 1
    user_hash = {}
    puts 'Please enter your first name:'
    user_hash['first_name'] = gets.chomp
    puts 'Please enter your last name:'
    user_hash['last_name'] = gets.chomp
    puts 'Please enter your gender (M/F):'
    user_hash['gender'] = gets.chomp
    puts 'Please enter a valid email:'
    user_hash['email'] = gets.chomp
    new_user = add_new_user(user_hash)
    puts '=' * 30
    puts 'Here is your user information:'
    print_user(new_user)
    user = find_user_by_email(new_user.email)
  when 2
    puts 'Please enter a valid email address:'
    email = gets.chomp
    puts 'Finding user...........'
    user = find_user_by_email(email)
    if user.nil?
      puts 'Could not find user. Please try again'
      next
    end
    puts 'User found!'
    puts '+' * 30
    print_user(user)
    puts '+' * 30
    path = 'email'
  when 3
    break
  else
    puts 'please enter 1 or 2'
    next
  end

  what_to_do_next = <<-NEXT
  |.---------------------.|
  ||                      ||
  ||  Hello #{user.first_name}
  ||  ~~~~~~~~~~~~        ||
  ||______________________||
  '-------. .--------------'
          | |    _|/
          | |  ."   ".
          | | /(O)-(O)\\
         /_)||   /     |
         |_)||  '-     |
         \\_)|\\ '.___.' /   |\\/|_
          | | \\  \\_/  /   _|  '/
          |_|\\ '.___.'    \\ ) /
          \\   \\_/\\__/\\__   |==|
           \\    \\ /\\ /\\ `\\ |  |
            \\    \\\\//     \\|  |
             `\\   /\\   |  /   |
               ;  ||   |\\____/
               |  ||   |

  NEXT

  user_input_email = nil
  until user_input_email == 4
    puts '=' * 30
    puts what_to_do_next
    puts '=' * 30
    puts 'What do you want to do next?'
    puts add_run_update_or_view_runs
    user_input_email = gets.chomp.to_i


    case user_input_email
    when 1
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
      puts '=' * 30
      puts 'Okay, you would like to update your current information.'
      puts 'Here is your current information:'
      update_user(user)
    when 4
      puts 'Going Back....'
    end
  end
end

goodbye =
<<-GOODBYE

======================================================================
==      =====    ====       ===       ===      ====  ====  ==        =
=   ==   ===  ==  ===  ====  ==  ====  ==  ===  ===   ==   ==  =======
=  ====  ==  ====  ==  ====  ==  ====  ==  ====  ===  ==  ===  =======
=  ========  ====  ==  ====  ==  ====  ==  ===  ====  ==  ===  =======
=  ========  ====  ==  ====  ==  ====  ==      ======    ====      ===
=  ===   ==  ====  ==  ====  ==  ====  ==  ===  ======  =====  =======
=  ====  ==  ====  ==  ====  ==  ====  ==  ====  =====  =====  =======
=   ==   ===  ==  ===  ====  ==  ====  ==  ===  ======  =====  =======
==      =====    ====       ===       ===      =======  =====        =
======================================================================
                  ,#####,
                  #_   _#
                  |e` `e|
                  |  u  |
                  \\  =  /
                  |\\___/|
         ___ ____/:     :\\____ ___
       .'   `.-===-\\   /-===-.`   '.
      /      .-"""""-.-"""""-.      \\
     /'             =:=             '\\
   .'  ' .:    o   -=:=-   o    :. '  `.
   (.'   /'. '-.....-'-.....-' .'\\   '.)
   /' ._/   ".     --:--     ."   \\_. '\\
  |  .'|      ".  ---:---  ."      |'.  |
  |  : |       |  ---:---  |       | :  |
   \\ : |       |_____._____|       | : /
   /   (       |----|------|       )   \\
  /... .|      |    |      |      |. ...\\
 |::::/'' jgs /     |       \\     ''\\::::|
 '""""       /'    .L_      `\\       """"'
            /'-.,__/` `\\__..-'\\
           ;      /     \\      ;
           :     /       \\     |
           |    /         \\.   |
           |`../           |  ,/
           ( _ )           |  _)
           |   |           |   |
           |___|           \\___|
           :===|            |==|
            \\  /            |__|
            /\\/\\           /"""`8.__
            |oo|           \\__.//___)
            |==|
            \\__/
GOODBYE
puts goodbye
