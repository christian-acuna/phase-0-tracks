require './setup.rb'

class Run
  attr_accessor :id, :duration, :calories, :location, :user_id,
                :ran_at, :created_at, :updated_at

  def initialize(attributes = {})
    @id = attributes['id']
    @duration = attributes['duration']
    @calories = attributes['calories']
    @location = attributes['location']
    @user_id = attributes['user_id']
    @ran_at = attributes['ran_at']
    @created_at = attributes['created_at']
    @updated_at = attributes['updated_at']
  end

  def self.all
    where('1 = 1')
  end

  def self.where(condition, *values)
    data = $db.execute("SELECT * FROM #{table_name} WHERE #{condition}", *values)
    create_runs(data)
  end

  def self.table_name
    'runs'
  end

  def table_name
    self.class.table_name
  end

  def save
    if id.nil?
      save_sql = <<-SQL
        INSERT INTO #{table_name}
        VALUES (NULL, ?, ?, ?, ?, ?, DATETIME('now'), DATETIME('now'))
      SQL
      $db.execute(save_sql, [duration, calories, location, user_id, ran_at])
      self.id = $db.last_insert_row_id
    else
      update_run = <<-SQL
        UPDATE #{table_name}
        SET duration = ?,
            calories = ?,
            location = ?,
            user_id = ?,
            ran_at = ?,
            updated_at = DATETIME('now')
        WHERE id = ?
      SQL
      $db.execute(update_run, [duration, calories, location, user_id, ran_at, id])
    end
  end

  private

  def self.create_runs(data)
    data.map do |run_attributes|
      Run.new(run_attributes)
    end
  end
end

# p Run.all
# p Run.where('id = ?', 100)
#
# p run = Run.new('duration' => 32, 'calories' => 120,
#               'location' => 'Los Angeles, CA',
#               'user_id' => 1, 'ran_at' => '20016-08-28')
#
# p run.save
