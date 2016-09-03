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
        duration INT,
        calories INT,
        location VARCHAR(64),
        user_id INT,
        ran_at DATETIME,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
      );
    SQL
    $db.execute(create_runs)
    $db.execute('CREATE INDEX runs_user_id ON runs(user_id);')
  end

  def self.seed_users(*values)
    seed_users_sql = <<-SQL
      INSERT INTO users
      VALUES (NULL, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'));
    SQL
    $db.execute(seed_users_sql, *values)
  end

  def self.seed_runs(*values)
    # https://stackoverflow.com/questions/14202944/sqlite-select-random-datetime-in-range
    random_date = <<-DATE
    datetime(strftime('%s', '2000-01-01 00:00:00') +
                abs(random() % (strftime('%s', '2000-01-31 23:59:59') -
                                strftime('%s', '2000-01-01 00:00:00'))
                   ), 'unixepoch')
                   DATE
    seed_runs_sql = <<-SQL
      INSERT INTO runs
      VALUES (NULL, ?, ?, ?, ?, #{random_date}, DATETIME('now'), DATETIME('now'));
    SQL
    $db.execute(seed_runs_sql, values)
  end
end
# 
# RunTrackerDB.setup
# 100.times do
#   RunTrackerDB.seed_users(Faker::Name.first_name, Faker::Name.last_name, 'M', Faker::Internet.email)
# end
# 100.times do
#   RunTrackerDB.seed_users(Faker::Name.first_name, Faker::Name.last_name, 'F', Faker::Internet.email)
# end
#
# 100.times do
#   location = "#{Faker::Address.city}, #{Faker::Address.state_abbr}"
#   RunTrackerDB.seed_runs(Faker::Number.number(2), Faker::Number.between(1, 700),
#                          location,
#                          Faker::Number.between(1, 200))
# end
