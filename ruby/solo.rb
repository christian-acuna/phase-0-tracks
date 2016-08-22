# Puseudocode

# Create a CLASS titled Museum
# INITIALIZE with the following attributes:
# - name
# - city
# - established
# - country
# - visitor_count

# Instance methods:
# - acquire_art
# - input: art_piece, price
# - PRINT "The #{name} acquired #{art_piece} for #{price}."

# - put_on_exhibition
# - input: exhibition_title, start_date, end_date
# - PRINT "#{name} will put on #{exhibition_title}, opening on #{start_date} until #{end_date}."

# - loan_object
# - input: object_to_loan, borrower, length
# - PRINT "#{name} will loan #{object_to_loan} to #{borrower} for #{length}."

class Museum
  attr_reader :name, :city, :established, :country
  attr_accessor :visitor_count

  def initialize(args)
    @name = args[:name]
    @city = args[:city]
    @established = args[:established]
    @country = args[:country]
    @visitor_count = args[:visitor_count]
  end

  def acquire_art(art_piece, price)
    puts "The #{name} acquired #{art_piece} for #{price}."
  end

  def put_on_exhibition(exhibition_title, start_date, end_date)
    puts "The #{name} will put on #{exhibition_title}, opening on #{start_date} until #{end_date}."
  end

  def loan_object(object_to_loan, borrower, length)
    puts "The #{name} will loan #{object_to_loan} to #{borrower} for #{length}."
  end
end

## Driver Code

# p the_Met = Museum.new(
#   name: 'Metropolitan Museum of Art',
#   city: 'New York City',
#   established: 'April 13, 1870',
#   country: 'United States',
#   visitor_count: 6_533_106
# )
#
# puts the_Met.acquire_art(
#   "Edward Steichen's 1904 photograph The Pond-Moonlight",
#   '$2.9 million'
# )
# puts the_Met.put_on_exhibition(
#   'Jerusalem 1000 – 1400: Every People Under Heaven',
#   'September 26, 2016', 'January 8, 2017'
# )
#
# puts the_Met.loan_object(
#   'the American West in Bronze, 1850 – 1925',
#   'the Nanjing Museum',
#   '1 year'
# )

def create_museum_hash
  input_hash = {}
  puts 'What is the name of the museum? (e.g., The Metropolitan Museum of Art)'
  input_hash[:name] = gets.chomp
  puts "What city is #{input_hash[:name]} located in?"
  input_hash[:city] = gets.chomp
  puts "When was #{input_hash[:name]} established?"
  input_hash[:established] = gets.chomp
  puts "Which country is #{input_hash[:name]} located in?"
  input_hash[:country] = gets.chomp
  puts "How many people visit #{input_hash[:name]} every year?"
  input_hash[:visitor_count] = gets.chomp

  input_hash
end

## User Interface
user_input = ''
user_created_museums = []
puts 'Hello, this program creates museums.'
until user_input.casecmp('done').zero?
  puts '=' * 30
  input_hash = create_museum_hash
  user_museum = Museum.new(input_hash)
  user_created_museums << user_museum
  puts "Please type 'done' if you are finished creating museums.
  Type 'c' if you would like to continue."
  user_input = gets.chomp
end

puts 'Thank you for using my program. Below is a summary of the museums you created:'
puts '-' * 30
user_created_museums.each_with_index do |museum, index|
  puts "Museum #{index + 1}:"
  puts "#{museum.name} was established in #{museum.established}."
  puts "It is located in #{museum.city}, #{museum.country}."
  puts "Every year #{museum.visitor_count} people visit #{museum.name}."
  puts '-' * 30
end
