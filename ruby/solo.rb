# Puseudocode

# Create a CLASS titled Museum
# INITIALIZE with the following attributes:
# - name
# - location
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
  attr_reader :name, :location, :established, :country
  attr_accessor :visitor_count

  def initialize(args)
    @name = args[:name]
    @location = args[:location]
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
#   location: 'New York City',
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

## User Interface
puts 'Hello, how many museums would you like to create?'
user_input = gets.chomp
until user_input.downcase == 'done'
  input_hash = {}
  puts 'What is the name of the museum?'
  input_hash[:name] = gets.chomp
  puts "What city is #{name} located?"
  input_hash[:location] = gets.chomp
  puts "When was #{name} established?"
  input_hash[:established] = gets.chomp

  # - name
  # - location
  # - established
  # - country
  # - visitor_count
end
