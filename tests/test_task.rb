require 'minitest/autorun'
# removed the require './app' 
require './task' 
require './task_manager' 

class TestTask < Minitest::Test 
  def test_task 
    task = Task.new(1,2) 
    # assert something here 
  end 
  
  def test_task_manager task_manager = Task_Manager.new 
    # assert something here 
  end 
end
