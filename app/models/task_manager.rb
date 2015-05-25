require 'sequel'

class TaskManager

  def self.database
    @database = Sequel.sqlite('db/task_manager.sqlite3')
  end

  def self.create(task)
    database.from(:tasks).insert(:title => task[:title], :description => task[:description])
  end

  def self.all
    database.from(:tasks).map do |data|
    Task.new(data)
    end
  end

  def self.find(id)
    task = database.from(:tasks).where(:id => id)
    Task.new(task.to_a.last)
  end

  def self.update(id, task)
    update_task = database.from(:tasks).where(:id => id)
   update_task.update(task)
  end

  def self.delete(id)
    database.from(:tasks).where(:id => id).delete
  end





end