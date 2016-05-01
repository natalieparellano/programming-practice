# This method takes an argument, and returns a wrapper "method" 
# that takes another "method" as an argument, and evaluates
# that method passing in the original argument.
def store_input( input )
  lambda { |&block| block.call( input ) }
end

# The method that I will pass as an argument. 
my_block = lambda { |x| puts x.to_s }

# Storing an input for a future passed in method.
store_a = store_input( "a" )
# => #<Proc:0x007ff82c8b9030@(irb):165 (lambda)>

store_a.call( &my_block )
# a
# => nil

# Nice article about why we use closures:
# http://wit.io/posts/ruby-is-beautiful-but-im-moving-to-python

# The above references "currying", this is a nice explanation:
# http://www.sitepoint.com/functional-programming-techniques-with-ruby-part-ii/
apply_math = lambda do |fn, a, b|
  a.send( fn, b )
end
# => #<Proc:0x007ff82da38fb8@(irb):207 (lambda)>

add = apply_math.curry.(:+)
# => #<Proc:0x007ff82db98a98 (lambda)>

add.(1,2)
# => 3