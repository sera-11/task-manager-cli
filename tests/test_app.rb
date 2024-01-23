require 'minitest/autorun'
require './app'

class TestTaskManager < Minitest::Test
  def setup
    @task_manager = TaskManager.new
  end

  def test_add_task
    @task_manager.add_task("Sample Task", "Due/Date")
    task = @task_manager.tasks.first
    assert_match "New task added to the list.", output
  end

  def test_remove_task
    @task_manager.add_task("Task 1", "01/30")
    @task_manager.add_task("Task 2", "02/05")
    
    output = capture_output { @task_manager.remove_task(1) }
    assert_match "Task completed and removed from list.", output
  end

end
