# test_task_manager.rb

require 'minitest/autorun'
require './app'

class TestTaskManager < Minitest::Test
  def setup
    @task_manager = Task_Manager.new  # Fix: use Task_Manager instead of TaskManager
  end

  def test_add_task
    output = capture_output { @task_manager.add_task("Sample Task", "Due/Date") }
    assert_match "New task added to the list.", output
    assert_equal 1, @task_manager.tasks.length
    assert_equal "Sample Task", @task_manager.tasks.first.description
    assert_equal "Due/Date", @task_manager.tasks.first.due_date
  end

  def test_remove_task
    @task_manager.add_task("Task 1", "01/30")
    @task_manager.add_task("Task 2", "02/05")

    output = capture_output { @task_manager.remove_task(1) }
    assert_match "Task completed and removed from list.", output
    assert_equal 1, @task_manager.tasks.length
    assert_equal "Task 1", @task_manager.tasks.first.description
    assert_equal "01/30", @task_manager.tasks.first.due_date
  end
  
end
