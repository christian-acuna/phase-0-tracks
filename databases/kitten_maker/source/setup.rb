require 'sqlite3'

$db = SQLite3::Database.new 'students.db'

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender VARCHAR(15),
          birthday DATETIME,
          email VARCHAR(255),

          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    $db.execute(
      <<-SQL
        INSERT INTO students (first_name, last_name, gender, birthday, email, created_at, updated_at)
        VALUES
          ('Brick', 'Thornton', 'male', DATETIME('1980-01-31'), 'brick@dbc.com', DATETIME('now'), DATETIME('now')),
          ('Mike', 'Busch', 'male', DATETIME('1983-05-22'), 'mike@dbc.com', DATETIME('now'), DATETIME('now'));
      SQL
    )
  end
end
