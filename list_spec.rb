require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"

describe List do

  Given(:title) { "Shopping List" } # Title to pass into the object as argument
  Given(:description) {"some string"}
  Given(:list) { List.new(title) } # Create a new instance of the object
  Given(:task) { Task.new(description) } # A new task with a description

  describe "#initialize" do
    context "should create a new list with given title" do
      When (:output){List.new(title)} # Create a new list with title 'Shopping List'
      Then {expect(output).to be_a_kind_of(List)}
    end

    context "did not create a new list without given title" do
      Then {expect{List.new}.to raise_error(ArgumentError)}
    end
  end

  describe "#add_task" do
    context "Check if tasks array has added a task object, i.e. not empty" do
      When {list.add_task(task)} # Push the task into array of tasks
      Then {expect(list.tasks.count).to eq(1)}
    end
  end

  describe "#complete_task" do
    context "Check if a task at a certain index in tasks array is complete(true) or not" do
    # Given(:tasks)
      When {
        list.add_task(task)
        list.complete_task(0)
      }
      Then {
        list.tasks[0].complete? == true
      }
      # Then {expect(list.tasks[0].complete?).to eq(true)}
    end
  end

  describe "#delete_task" do
    context "Test if a single task has been removed from the tasks array" do
      When {
        list.add_task(task)
        list.delete_task(0)
      }
      Then {
        list.tasks[0] == nil
      }
    end
  end

  describe "#completed_tasks" do
    context "Check tasks that are complete" do
      When {
        list.add_task(task)
        list.complete_task(0)
      }
      Then {
        list.completed_tasks[0].complete? == true
      }
    end
  end

  describe "#incomplete_tasks" do
    context "Check tasks that are incomplete" do
      When {
        list.add_task(task)
        list.incomplete_tasks
      }
      Then {
        list.incomplete_tasks[0].complete? == false
      }
    end
  end
end
