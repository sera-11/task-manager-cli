require_relative "task"


puts "Welcome! I am your Task Manager. "


class Task_Manager
  def initialize 
    @tasks = []
  end

  def main
    loop do
      puts "How can I help you? "
      puts "1. Add a task"
      puts "2. List tasks"
      puts "3. Remove a task"
      puts "4. Exit"
      print "What would you like to do? "
      choice = gets.chomp.to_i

      puts " "

      case choice
      when 1 
        add_task
        puts " "
      when 2
        list_tasks
        puts " "
      when 3
        remove_task
        puts " "
      when 4
        puts "Thank you for using your handy Task Manager. Remember to check your tasks! Goodbye!"
        break
      else
        puts "Invalid option. Try again"
      end
    end
  end

  def add_task
    print "Enter your tasks description: "
    description = gets.chomp
    print "What is your task due? (MM/DD): "
    due_date = gets.chomp
    @tasks << Task.new(description, due_date)
    puts "New task added to the list."
  end

  def list_tasks
    if @tasks.empty?
      puts "There are no tasks to do. "
    else
      puts "Your tasks to do: "
      @tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}"
      end
    end
  end

  def remove_task
    if @tasks.empty?
      puts "There are no tasks to remove."
    else
      list_tasks

      print "Which task did you complete?"
      completed = gets.chomp.to_i

      index = completed - 1

      removed_task = @tasks.delete_at(index)

      puts "Task completed and removed from list."
    end

  end
end
