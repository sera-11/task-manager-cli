require 'minitest/autorun'
require './app'

class TestTaskManager < Minitest::Test
  def setup
    @task_manager = Task_Manager.new
  end

  def test_task_manager
    # Test add_task
    input_tests("Homework", "01/30") do
      capture_output { @task_manager.add_task }
    end

    assert_equal 1, @task_manager.tasks.length
    assert_equal "Homework", @task_manager.tasks.first.description
    assert_equal "01/30", @task_manager.tasks.first.due_date

    # Test remove_task
    input_tests("1") do
      capture_output { @task_manager.remove_task }
    end

    assert_equal 0, @task_manager.tasks.length

    # Test exit
    input_tests("4") do
      output = capture_output { @task_manager.main }
      assert_match /Thank you for using your handy Task Manager\. Remember to check your tasks! Goodbye!/, output
   end
  end

  def input_tests(*inputs)
    original_stdin = $stdin
    $stdin = StringIO.new(inputs.join("\n"))
    yield
  ensure
    $stdin = original_stdin
  end

  def capture_output
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end
end
