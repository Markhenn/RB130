require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal(@todos[1..-1], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal(@todos[0..-2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_adding_not_a_todo
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('ho') }
  end

  def test_shovel
    todo4 = Todo.new('test')
    @list << todo4
    assert_includes(@list.to_a, todo4)
  end

  def test_add
    todo4 = Todo.new('test')
    @list.add(todo4)
    assert_includes(@list.to_a, todo4)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_raises(IndexError) { @list.mark_done_at(100) }
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_undone_at(0)
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    assert_equal(@todo1, @list.remove_at(0))
    assert_equal(@todos[1..-1], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

  assert_equal(output, @list.to_s)
  end

  def test_to_s_done
    @todo1.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

  assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    @list.done!
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

  assert_equal(output, @list.to_s)
  end

  def test_each_iteration
    counter = 0
    @list.each { counter += 1 }
    assert_equal(3, counter)
  end

  def test_each_return_value
    same_list = @list.each { |todo| nil }
    assert_same(@list, same_list)
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
    assert_instance_of(TodoList, @list.select { |todo| nil })
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title(@todo1.title))
    assert_nil(@list.find_by_title('test'))
  end

  def test_all_done
    @todo1.done!
    @todo2.done!

    assert_equal([@todo1, @todo2], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!

    assert_equal([@todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_nil(@list.mark_done('test'))
    @list.mark_done(@todo1.title)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_mark_all_undone
    @todo1.done!
    @todo2.done!
    @todo3.done!
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end
end

