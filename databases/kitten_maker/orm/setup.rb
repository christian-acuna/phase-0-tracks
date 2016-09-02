require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file
$db = SQLite3::Database.new "students.db"
$db.results_as_hash = true
$db.type_translation = true

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          gender VARCHAR(1) NOT NULL,
          birthdate DATE NOT NULL,
          email VARCHAR(255) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students
        VALUES
          (NULL, 'Brick','Thornton','M','1980-07-01','brick@dbc.com',DATETIME('now'),DATETIME('now')),
          (NULL, 'Mike', 'Busch','M','1983-05-22','mike@dbc.com',DATETIME('now'),DATETIME('now')),
          (NULL, 'Jacky', 'Sum','M','1988-05-28','jacky@gmail.com',DATETIME('now'),DATETIME('now'));
      SQL
    )
  end
end

# StudentDB.setup
# StudentDB.seed
