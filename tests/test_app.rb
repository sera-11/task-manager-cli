# test_app.rb

require 'minitest/autorun'
require './app'

require 'minitest/autorun'
require './app'

class TestTaskManager < Minitest::Test
  def setup
    @task_manager = Task_Manager.new
  end

  def test_add_task
    def test_add_task
      output = capture_output { @task_manager.add_task }
      assert_match "New task added to the list.", output
      assert_equal 1, @task_manager.instance_variable_get(:@tasks).length
      assert_equal "Homework", @task_manager.instance_variable_get(:@tasks).first.description
      assert_equal "01/30", @task_manager.instance_variable_get(:@tasks).first.due_date
    end
    
  end

  def test_remove_task
    output = capture_output { @task_manager.remove_task }
    assert_match(/Task completed and removed from list\.|There are no tasks to remove\./, output)
    assert_equal 0, @task_manager.instance_variable_get(:@tasks).length
  end

  # Add the capture_output method here
  def capture_output
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end
