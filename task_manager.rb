#task_manager.rb
require_relative "task"


class TaskManager
  def initialize 
    @tasks = []
  end

  def main
    loop do
      puts " "
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
        print "Enter your tasks description: "
        description = gets.chomp
        print "What is your task due? (MM/DD): "
        due_date = gets.chomp
        puts " "
        add_task(description,due_date)
      when 2
        list_tasks
        puts " "
      when 3
        puts " "
        if @tasks.empty?
          puts "There are no tasks to remove."
        else
          list_tasks
    
          print "Which task did you complete?"
          completed = gets.chomp.to_i
    
          index = completed - 1
          remove_task(index)
        end
        puts " "
      when 4
        exit_app
        break
      else
        puts "Invalid option. Try again"
      end
    end
  end

  def add_task(description, due_date)
    @tasks << Task.new(description, due_date)
    return "New task added to the list."
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

  def remove_task(index)
    removed_task = @tasks.delete_at(index)

    return "Task completed and removed from list."

  end

  def exit_app
    return "Thank you for using your handy Task Manager. Remember to check your tasks! Goodbye!"
  end

  def tasks
    @tasks
  end

end
