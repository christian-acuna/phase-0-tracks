class Student
  attr_accessor :id, :first_name, :last_name, :gender, :birthday, :email, :created_at, :updated_at
  def initialize(id, first_name, last_name, gender, birthday, email, created_at, updated_at)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @gender = gender
    @birthday = birthday
    @email = email
    @created_at = created_at
    @updated_at = updated_at
  end
  def self.all
    # return an array of Student instances for each row in the database

    rows = $db.execute('select * from students;')

    rows.map do |row|
      Student.new(*row)
    end
  end

  def self.where(condition, *args)
    rows = $db.execute("SELECT * FROM students WHERE #{condition}", args)
    rows.map do |row|
      Student.new(*row)
    end
  end
end
