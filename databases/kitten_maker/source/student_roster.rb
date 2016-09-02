class Student
  attr_accessor :id, :first_name, :last_name, :gender, :birthday, :email, :created_at, :updated_at
  def initialize (id, first_name, last_name, gender, birthday, email, created_at, updated_at)
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
    where('1 = 1')
  end

  def self.where(condition, *arg)
    rows = $db.execute("SELECT * FROM #{table_name} WHERE #{condition}", arg)
    create_students(rows)
  end

  def self.table_name
    'students'
  end

  def table_name
    self.class.table_name
  end

  def self.find(id)
    where('id = ? LIMIT 1', id).first
  end
  def save
    if id.nil?
      # insert into the database...
      insert_into = <<-SQL
      INSERT INTO #{table_name}
      (first_name, last_name, gender, birthday, email, created_at, updated_at)
      values (?,?,?,?,?, DATETIME('now'), DATETIME('now'))
      SQL
      $db.execute(insert_into, [first_name, last_name, gender, birthday, email])
      # ask the database what id it just assigned to the object
      self.id = $db.last_insert_row_id
    else
      # generate an upadate statement and update the updated_at field

      update_students = <<-SQL
      UPDATE #{table_name}
      SET first_name = ?,
          last_name = ?,
          gender = ?,
          birthday = ?,
          email = ?,
          updated_at = DATETIME('now')
      WHERE id = ?
      SQL
      $db.execute(update_students, [first_name, last_name, gender, birthday, email, id])
    end
  end

  def destroy
    $db.execute("DELETE FROM #{table_name} WHERE id = ?", id)
  end


  private

  def self.create_students(rows)
    rows.map do |row|
      Student.new(*row)
    end
  end
end
