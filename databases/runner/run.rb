require './setup.rb'

class Run
  attr_accessor :id, :duration, :calories, :location, :user_id,
                :ran_at, :created_at, :updated_at

  def initialize(attributes = {})
    @id = attributes['id']
    @duration = attributes['duration']
    @duration = attributes['duration']
    @calories = attributes['calories']
    @location = attributes['location']
    @user_id = attributes['user_id']
    @ran_at = attributes['ran_at']
    @created_at = attributes['created_at']
    @updated_at = attributes['updated_at']
  end

  def self.all
    row = $db.execute('SELECT * FROM runs;')

    row.map do |run_attributes|
      Run.new(run_attributes)
    end
  end

  def self.where(condition, *values)
    data = $db.execute("SELECT * FROM runs WHERE #{condition}", *values)

    data.map do |run_attributes|
      Run.new(run_attributes)
    end
  end
end

# p Run.all
p Run.where('id = ?', 100)
