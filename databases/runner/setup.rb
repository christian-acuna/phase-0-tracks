require 'sqlite3'
require 'faker'

$db = SQLite3::Database.new 'run_tracker.db'
$db.results_as_hash = true
$db.type_translation = true

module RunTrackerDB
  def self.setup
    create_users = <<-SQL
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name VARCHAR(64) NOT NULL,
        last_name VARCHAR(64) NOT NULL,
        gender VARCHAR(16),
        email VARCHAR(255) NOT NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL
      );
    SQL
    $db.execute(create_users)
    $db.execute('CREATE UNIQUE INDEX user_email ON users (email);')

    create_runs = <<-SQL

      CREATE TABLE runs(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        duration VARCHAR(16),
        calories REAL,
        location VARCHAR(64),
        ran_at DATETIME,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        user_id INT,
        FOREIGN KEY(user_id) REFERENCES users(id)
      );
    SQL
    $db.execute(create_runs)
    $db.execute('CREATE INDEX runs_user_id ON runs(user_id);')
  end
end

RunTrackerDB.setup
