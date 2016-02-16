# find Big O

require 'pry'
include Math

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

def is_prime( num )
  (2..sqrt( num )).each do |i|
    if num % i == 0
      puts "is not prime! (divisible by #{i})"
      puts ""
      return false
    end
  end
  puts "is prime!"
  puts ""
  return true 
end

is_prime( 107 )
# O(sqrt(N))

def factorial( num )
  val = if num < 0
    -1
  elsif num == 0
    1
  else
    num * factorial( num - 1 )
  end
  puts val
  puts ""
  return val 
end

factorial( 4 )
# O(N)

def permutation( str, prefix="" )
  if str.length == 0
    puts "prefix: #{prefix}"
  else
    (0..str.length-1).each do |i|
      remove_char = str.slice( 0, i ) + str.slice( i+1, str.length-1 )
      permutation( remove_char, prefix + str[i] )
    end
  end
end

puts ""

permutation( "hello" )
# O(N!)

def fib( n )
  # puts "n = #{n}"
  if n <= 0
    # puts "the end!"
    0
  elsif n == 1
    # puts "the end!"
    1    
  else
    fib( n - 1 ) + fib( n - 2 )
  end
end

puts ""

answer = fib( 6 )
puts "answer: #{answer}"
puts ""
# O(2**N)

def all_fib( n )
  (0..n).each do |i|
    puts fib( i )
  end
end

all_fib( 6 )
puts ""
# O(2**(N+1)) or just O(2**N)

def better_fib( n, arr )
  puts "n = #{n}; arr = #{arr}"
  if n <= 0
    puts "the end!"
    0
  elsif n == 1
    puts "the end!"
    1    
  elsif arr[n] && arr[n] > 0
    puts "found it! arr[#{n}] = #{arr[n]}"
    arr[n]
  else
    arr[n] = better_fib( n-1, arr ) + better_fib( n-2, arr )
    puts "computed a[#{n}] = #{arr[n]}"
    arr[n]
  end
end

answer = better_fib( 6, [] )
puts "answer: #{answer}"
puts ""
# O(N)

def powers_of_2( n )
  if n < 1
    0
  elsif n == 1
    puts 1
    1
  else
    prev = powers_of_2( n/2 )
    curr = prev * 2
    puts curr
    curr
  end
end

powers_of_2( 256 )
puts ""
# O(log N)

def sqrt_helper( n, min, max )
  puts "min: #{min}; max: #{max}"
  if max < min
    -1
  else
    guess = ( min + max ) / 2
    puts "guess: #{guess}"

    if guess**2 == n
      guess
    elsif guess**2 < n # too low
      sqrt_helper( n, guess+1, max )
    else
      sqrt_helper( n, min, guess-1 )
    end

  end
end

sqrt_helper( 100, 1, 100 )
puts ""
# O(log N)

def append_to_new( arr, val )
  bigger = []
  (0..arr.length).each do |i|
    bigger[i] = arr[i]
  end
  bigger[bigger.length-1] = val
  puts "bigger: #{bigger.inspect}"
  bigger
end
# O(N)

def copy_array( arr )
  copy = []
  arr.each do |i|
    copy = append_to_new( copy, i )
  end
  copy
end

append_to_new( [1,1,2,3,5], 8 )
puts ""

copy_array( [1,1,2,3,5,8] )
puts ""
