require 'minitest/autorun'
# removed the require './app' 
require './task' 
require './task_manager' 

class TestTask < Minitest::Test 
  def test_task 
    task = Task.new("Homework","01/30") 
    # assert something here 
    assert_equal "Homework", task.description, "Description should match"
    assert_equal "01/30", task.due_date, "Due date should match"


  end 
  
  def test_task_manager 
    task_manager = TaskManager.new 

    # assert something here 
    assert_match "New task added to the list.", task_manager.add_task("Homework", "01/30"), "Task method failed"

    assert_match "Task completed and removed from list.", task_manager.remove_task(1), "Failure to remove task"

    assert_match "Thank you for using your handy Task Manager. Remember to check your tasks! Goodbye!", task_manager.exit_app, "Try again"
    
  end 
end
