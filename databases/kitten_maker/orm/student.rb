require './setup.rb'
class Student
  # output is a collection of Student objects
  attr_accessor :id, :first_name, :last_name, :gender, :birthdate, :email,
                :created_at, :updated_at

  def initialize(attributes = {})
    @id = attributes['id']
    @first_name = attributes['first_name']
    @last_name = attributes['last_name']
    @gender = attributes['gender']
    @birthdate = attributes['birthdate']
    @email = attributes['email']
    @created_at = attributes['created_at']
    @updated_at = attributes['updated_at']
  end

  def self.all
    # get the raw data from the database
    data = $db.execute('SELECT * FROM students')
    # transform the raw data
    data.map do |student_attributes|
      Student.new(student_attributes)
    end
  end

  def self.where(condition, *values)
    data = $db.execute("SELECT * FROM students WHERE #{condition}", *values)
    # transform the raw data
    data.map do |student_attributes|
      Student.new(student_attributes)
    end
  end

  def save
    if id.nil?
      save = <<-SQL
          INSERT INTO students
          VALUES
          (NULL, ?, ?, ?, ?, ?, DATETIME('now'), DateTime('now'))
          SQL
      $db.execute(save, first_name, last_name, gender, birthdate, email)
      self.id = $db.last_insert_row_id
    end
  end
end

# p Student.all
p Student.where('first_name = ?', 'Jacky')
students = Student.where('first_name = ? AND last_name = ?', 'Mike', 'Busch')

tara = Student.new('first_name' => 'Tara', 'last_name' => 'Roys', 'gender' => 'F',
                    'birthdate' => '1987-04-14', 'email' => 'troys@gmail.com')
tara.save
t2 = Student.where('first_name = ?', 'Tara')
p t2.length
