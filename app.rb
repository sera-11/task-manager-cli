#app.rb

require_relative "task_manager"

task_manager = Task_Manager.new
task_manager.main

puts "Welcome! I am your Task Manager. "
