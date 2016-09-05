# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  p params
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  p params
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# A /contact route that displays an address
get '/contact' do
  '123 Fake Street <br />
   Nowhere, USA'
end

# A /great_job route that can take a person's name as a query parameter
get '/great_job' do
  person = params[:person]
  "Good job, #{person}!"
end

# A route that uses route parameters to add two numbers and respond with the result.
get '/add/:num1/:num2' do
  num1 = params[:num1].to_i
  num2 = params[:num2].to_i
  result = num1 + num2
  "The addition of #{num1} and #{num2} is #{result}."
end
# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

#  A route that allows the user to search the database by age
get '/search/:age' do
  p students = db.execute("SELECT * FROM students WHERE age = ?", params[:age])
  search_result = ""
  students.each do |student|
    search_result << "ID: #{student['id']}<br>"
    search_result << "Name: #{student['name']}<br>"
    search_result << "Age: #{student['age']}<br>"
    search_result << "Campus: #{student['campus']}<br><br>"
  end
  search_result
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Is Sinatra the only web app library in Ruby? What are some others?
# Padrino, volt, grape, RubyMotion are few examples of other Ruby web libraries

# Are SQLite and the sqlite3 gem your only options for using a database
# with Sinatra? What are some others?
# Otther SQL Database Adapters are pg, mysql2, and mysql

# What is meant by the term web stack?
# The technologies, languages, operating systems, and compenets used to build web apps.
