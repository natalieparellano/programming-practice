# find Big O

require 'pry'

arr = [1,2,3,4]

def foo( arr )
  sum = 0
  product = 1
  arr.each do |el|
    sum += el
  end
  arr.each do |el|
    product *= el
  end
  puts "sum is #{sum}; product is #{product}"
  puts ""
end

foo( arr )
# O(N)

def print_pairs( arr )
  arr.each do |i|
    arr.each do |j|
      puts "#{i}, #{j}"
    end
  end
  puts ""
end

print_pairs( arr )
# O(N**2)

def print_unordered_pairs( arr )
  arr.each.with_index do |out_el, i|
    arr.slice( i+1, arr.length-1 ).each do |in_el|
      puts "#{out_el}, #{in_el}"      
    end
  end
  puts ""
end

print_unordered_pairs( arr )
# O(N**2)

def print_unordered_pairs( arr1, arr2 )
  arr1.each.with_index do |out_el, i|
    arr2.each.with_index do |in_el, j|
      if arr1[i] < arr2[j]
        puts "hi"
      end
    end
  end
  puts ""
end

print_unordered_pairs( arr, arr )
# O( arr1.length * arr2.length )

def print_unordered_pairs( arr1, arr2 )
  arr1.each.with_index do |out_el, i|
    arr2.each.with_index do |in_el, j|
      (0..40).each do |k|
        print "."
      end
      puts ""
    end
  end
  puts ""
end

print_unordered_pairs( arr, arr )
# O( arr1.length * arr2.length )

def reverse( arr )
  puts "start arr: #{arr}"
  arr[0..arr.length/2-1].each.with_index do |el, i|
    puts "i: #{i}"
    puts "el: #{el}"

    j     = arr.length - i - 1
    other = arr[j]
    puts "j: #{j}"
    puts "other: #{other}"

    arr[i] = other
    arr[j] = el
    puts "arr: #{arr}"
  end
  puts "final arr: #{arr}"
  puts ""
end

reverse( arr )
# O(N)

