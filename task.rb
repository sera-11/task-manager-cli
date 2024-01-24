#task.rb

class Task
  attr_accessor :description, :due_date

  def initialize(description, due_date)
    @description = description
    @due_date = due_date
  end

  def to_s
    "#{@description} is due by #{@due_date}"
  end
end
