require 'pry'

class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize( data, next_node=nil )
    @data      = data
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def self.new_from_values( arr )
    head = Node.new( arr.shift )
    linked_list = LinkedList.new( head )
    arr.each do |val|
      new_node = Node.new( val )
      linked_list.append_to_tail( new_node )
    end
    return linked_list
  end

  def self.sum_lists( list1, list2 )
    sum        = list1.head.data + list2.head.data # head.data
    res_start  = sum % 10 
    carry_over = sum / 10

    result = LinkedList.new_from_values( [res_start] )

    pointer1 = list1.head.next_node
    pointer2 = list2.head.next_node

    while pointer1 || pointer2 || ( carry_over > 0 )
      val1 = pointer1 ? pointer1.data : 0
      val2 = pointer2 ? pointer2.data : 0 # typo

      sum = val1 + val2 + carry_over

      res_next   = sum % 10 
      carry_over = sum / 10 

      result.append_to_tail( Node.new( res_next ))

      pointer1 = pointer1 ? pointer1.next_node : nil # check for nil on intermediate result 
      pointer2 = pointer2 ? pointer2.next_node : nil
    end

    return result
  end

  def initialize( head )
    @head = head
  end

  def append_to_head( node )
    node.next_node = head
    self.head = node
  end

  def append_to_tail( node )
    pointer = find_tail
    pointer.next_node = node
  end

  def find_kth_to_last( k )
    current = head
    runner = head
    k.times do 
      runner = runner.next_node
    end
    while runner.next_node
      current = current.next_node
      runner = runner.next_node
    end
    return current
  end

  def partition( val )
    # initial setup
    previous = nil
    pointer  = head
    # iterate through the nodes 
    while pointer
      if pointer.data >= val
        # update the pointers
        previous = pointer
        pointer  = pointer.next_node
      else
        cached  = pointer.next_node
        removed = remove_node( pointer, previous )
        append_to_head( removed )
        pointer = cached
      end
    end
    return self 
  end

  def print_values
    pointer = head
    values = []
    while pointer
      values << pointer.data
      pointer = pointer.next_node
    end
    puts values.inspect
  end

  def remove_node( node, previous )
    if previous
      previous.next_node = node.next_node
    else
      self.head = node.next_node # fixed bug...can't use implicit receiver for assignment 
    end
    node.next_node = nil # wipe it out
    return node
  end

  def remove_dups
    cache = {}

    pointer = head
    previous = nil

    while pointer
      if cache[pointer.data]
        remove_node( pointer, previous )
        pointer = previous.next_node
      else
        cache[pointer.data] = true 
        previous = pointer
        pointer = pointer.next_node
      end          
    end

    return self
  end

  def remove_dups_no_cache
    current = head
    runner = head
    while current
      while runner.next_node
        if runner.next_node.data == current.data
          runner.next_node = runner.next_node.next_node
        else
          runner = runner.next_node
        end
      end
      current = current.next_node
      runner  = current
    end
    return self 
  end

  private

    def find_tail
      pointer = head
      while pointer.next_node
        pointer = pointer.next_node
      end
      pointer
    end
end

linked_list = LinkedList.new_from_values( ["a","b","b"] )
puts linked_list.remove_dups.inspect
puts ""

linked_list = LinkedList.new_from_values( ["a","b","b"] )
puts linked_list.remove_dups_no_cache.inspect
puts ""

linked_list = LinkedList.new_from_values( ["a","b","b","c"] )
puts linked_list.find_kth_to_last( 2 ).inspect
puts linked_list.find_kth_to_last( 1 ).inspect
puts linked_list.find_kth_to_last( 0 ).inspect
puts ""

linked_list = LinkedList.new_from_values( [3,5,8,5,10,2,1] )
puts linked_list.partition( 5 ).print_values
puts ""

list1 = LinkedList.new_from_values( [7,1,6] )
list2 = LinkedList.new_from_values( [5,9,2] )
puts LinkedList.sum_lists( list1, list2 ).print_values

list1 = LinkedList.new_from_values( [7,1,6,4] )
list2 = LinkedList.new_from_values( [5,9,2] )
puts LinkedList.sum_lists( list1, list2 ).print_values

list1 = LinkedList.new_from_values( [9,7,8] )
list2 = LinkedList.new_from_values( [6,8,5] )
puts LinkedList.sum_lists( list1, list2 ).print_values
