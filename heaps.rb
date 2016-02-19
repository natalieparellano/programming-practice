require 'pry'

class Heap

  attr_accessor :heap_list

  def initialize( value_list )
    set_heap_list( value_list )
  end

  private

    def set_heap_list( value_list )
      @heap_list = []

      until value_list.empty?
        current = value_list.pop
        @heap_list << current

        child_i  = @heap_list.length-1
        parent_i = find_parent_i( child_i )

        if parent_i && ( @heap_list[parent_i] < @heap_list[child_i] )
          swap_until_valid( child_i )
        end
      end
    end

    def find_parent_i( child_i )
      parent_i = (child_i-1)/2
      ( parent_i >= 0 ) ? parent_i : nil      
    end

    def swap_until_valid( child_i )
      parent_i = find_parent_i( child_i )

      until parent_i.nil? || ( @heap_list[parent_i] >= @heap_list[child_i] )
        child_value  = @heap_list[child_i] # this could be optimized
        parent_value = @heap_list[parent_i]

        @heap_list[child_i]  = parent_value
        @heap_list[parent_i] = child_value

        child_i  = parent_i
        parent_i = find_parent_i( child_i )
      end
    end

end

heap = Heap.new( [1,2,3,6,4,1,5] )
puts heap.heap_list.inspect
puts ""