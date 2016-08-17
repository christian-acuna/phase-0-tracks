# Puseudocode

# Create a CLASS titled Museum
  # INITIALIZE with the following attributes:
  # - name
  # - location
  # - established
  # - country
  # - visitor_count

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
end

p the_Met = Museum.new(
  name: 'Metropolitan Museum of Art',
  location: 'New York City',
  established: 'April 13, 1870',
  country: 'United States',
  visitor_count: 6533106
)

puts the_Met.acquire_art("Edward Steichen's 1904 photograph The Pond-Moonlight",'$2.9 million')


  # Instance methods:
  # - acquire_art
    # - input: art_piece, price
    # - PRINT
  # - put_on_exhibition
    # - input: exhibition_title, start_date, end_date
    # - PRINT
  # - loan_object
    # - input: object_to_loan, borrower, length
    # - PRINT
