class User
  attr_accessor :id, :first_name, :last_name, :gender, :email, :created_at, :updated_at

  def initialize(attributes = {})
    @id = attributes['id']
    @first_name = attributes['first_name']
    @last_name = attributes['last_name']
    @gender = attributes['gender']
    @email = attributes['email']
    @created_at = attributes['created_at']
    @updated_at = attributes['updated_at']
  end

  def self.all
    where('1 = 1')
  end

  def self.where(condition, *values)
    data = $db.execute("SELECT * FROM #{table_name} WHERE #{condition}", *values)
    create_users(data)
  end

  def self.table_name
    'users'
  end

  def table_name
    self.class.table_name
  end

  def save
    if id.nil?
      save_sql_users = <<-SQL
        INSERT INTO #{table_name}
        VALUES (NULL, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'))
      SQL
      $db.execute(save_sql_users, [first_name, last_name, gender, email])
      self.id = $db.last_insert_row_id
    else
      update_run = <<-SQL
        UPDATE #{table_name}
        SET first_name = ?,
            last_name = ?,
            gender = ?,
            email = ?,
            updated_at = DATETIME('now')
        WHERE id = ?
      SQL
      $db.execute(update_run, [first_name, last_name, gender, email, id])
    end
  end

  private

  def self.create_users(data)
    data.map do |user_attributes|
      User.new(user_attributes)
    end
  end
end

User.new('first_name' => 'Chris', 'last_name' => 'Acuna', 'gender' => 'M', 'email' => 'cacuna@gmail.com')
